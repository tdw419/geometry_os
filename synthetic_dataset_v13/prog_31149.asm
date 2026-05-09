; DESCRIPTION: Composite: Places a yellow 31x113 rectangle at position (3, 109) then Renders a orange line between points (262, 126) and (272, 84).
; PLAN: r0=3(x), r1=109(y), r2=31(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x1), r6=126(y1), r7=272(x2), r8=84(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 109
LDI r2, 31
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 126
LDI r7, 272
LDI r8, 84
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
