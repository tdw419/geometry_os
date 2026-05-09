; DESCRIPTION: Composite: Renders a blue disk with center (182, 39) and radius 31 then Draws a white line from (378, 55) to (136, 44) then Sets a single white pixel at (236, 81).
; PLAN: r0=182(x), r1=39(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x1), r6=55(y1), r7=136(x2), r8=44(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=236(x), r11=81(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 39
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 55
LDI r7, 136
LDI r8, 44
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 81
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
