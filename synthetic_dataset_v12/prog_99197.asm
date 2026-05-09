; DESCRIPTION: Composite: Draws a cyan circle centered at (329, 189) with radius 49 then Renders a blue line between points (161, 254) and (175, 78).
; PLAN: r0=329(x), r1=189(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x1), r6=254(y1), r7=175(x2), r8=78(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 189
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 254
LDI r7, 175
LDI r8, 78
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
