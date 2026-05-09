; DESCRIPTION: Composite: Places a magenta line segment connecting (217, 11) to (301, 136) then Draws a cyan circle centered at (89, 200) with radius 47 then Sets a single white pixel at (104, 171).
; PLAN: r0=217(x1), r1=11(y1), r2=301(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=89(x), r6=200(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=171(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 217
LDI r1, 11
LDI r2, 301
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 200
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 171
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
