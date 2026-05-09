; DESCRIPTION: Composite: Places a black 13x30 rectangle at position (91, 0) then Renders a red line between points (489, 9) and (151, 49).
; PLAN: r0=91(x), r1=0(y), r2=13(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=489(x1), r6=9(y1), r7=151(x2), r8=49(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 0
LDI r2, 13
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 9
LDI r7, 151
LDI r8, 49
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
