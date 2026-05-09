; DESCRIPTION: Composite: Sets a single white pixel at (47, 243) then Renders a green line between points (256, 230) and (487, 158) then Draws a white circle centered at (459, 198) with radius 51.
; PLAN: r0=47(x), r1=243(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=256(x1), r6=230(y1), r7=487(x2), r8=158(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=459(x), r11=198(y), r12=51(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 243
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 230
LDI r7, 487
LDI r8, 158
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 198
LDI r12, 51
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
