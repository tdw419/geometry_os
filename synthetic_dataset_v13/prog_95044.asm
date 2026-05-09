; DESCRIPTION: Composite: Renders a yellow line between points (24, 184) and (217, 210) then Draws a orange circle centered at (205, 214) with radius 40.
; PLAN: r0=24(x1), r1=184(y1), r2=217(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=214(y), r7=40(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 184
LDI r2, 217
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 214
LDI r7, 40
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
