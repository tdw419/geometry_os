; DESCRIPTION: Composite: Sets a single blue pixel at (372, 38) then Renders a cyan disk with center (221, 108) and radius 66 then Places a purple line segment connecting (175, 0) to (43, 82).
; PLAN: r0=372(x), r1=38(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=108(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x1), r11=0(y1), r12=43(x2), r13=82(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 38
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 221
LDI r6, 108
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 0
LDI r12, 43
LDI r13, 82
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
