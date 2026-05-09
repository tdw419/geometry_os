; DESCRIPTION: Composite: Draws a black circle centered at (303, 142) with radius 55 then Renders a white line between points (189, 13) and (112, 218) then Sets a single purple pixel at (403, 192).
; PLAN: r0=303(x), r1=142(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x1), r6=13(y1), r7=112(x2), r8=218(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=403(x), r11=192(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 142
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 13
LDI r7, 112
LDI r8, 218
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 403
LDI r11, 192
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
