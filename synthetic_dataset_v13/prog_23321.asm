; DESCRIPTION: Composite: Sets a single white pixel at (436, 223) then Renders a green disk with center (83, 127) and radius 29 then Renders a cyan line between points (315, 122) and (200, 196).
; PLAN: r0=436(x), r1=223(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=127(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x1), r11=122(y1), r12=200(x2), r13=196(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 223
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 127
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 122
LDI r12, 200
LDI r13, 196
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
