; DESCRIPTION: Composite: Renders a white disk with center (142, 92) and radius 44 then Renders a purple line between points (380, 57) and (185, 211) then Sets a single white pixel at (482, 113).
; PLAN: r0=142(x), r1=92(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x1), r6=57(y1), r7=185(x2), r8=211(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=482(x), r11=113(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 92
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 57
LDI r7, 185
LDI r8, 211
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 113
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
