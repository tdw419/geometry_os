; DESCRIPTION: Composite: Places a black 109x75 rectangle at position (103, 7) then Renders a red line between points (233, 7) and (389, 46).
; PLAN: r0=103(x), r1=7(y), r2=109(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x1), r6=7(y1), r7=389(x2), r8=46(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 7
LDI r2, 109
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 7
LDI r7, 389
LDI r8, 46
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
