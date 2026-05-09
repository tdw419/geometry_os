; DESCRIPTION: Composite: Renders a blue line between points (392, 111) and (276, 31) then Places a yellow circle of radius 66 at center (369, 190) then Sets a single white pixel at (175, 142).
; PLAN: r0=392(x1), r1=111(y1), r2=276(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=190(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x), r11=142(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 111
LDI r2, 276
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 190
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 142
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
