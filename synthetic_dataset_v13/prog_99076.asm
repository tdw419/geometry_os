; DESCRIPTION: Composite: Draws a yellow circle centered at (90, 198) with radius 14 then Renders a green line between points (280, 198) and (167, 161).
; PLAN: r0=90(x), r1=198(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x1), r6=198(y1), r7=167(x2), r8=161(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 198
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 198
LDI r7, 167
LDI r8, 161
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
