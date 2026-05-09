; DESCRIPTION: Composite: Sets a single black pixel at (353, 170) then Renders a blue disk with center (472, 103) and radius 21 then Places a magenta line segment connecting (335, 190) to (90, 180).
; PLAN: r0=353(x), r1=170(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=472(x), r6=103(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x1), r11=190(y1), r12=90(x2), r13=180(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 170
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 472
LDI r6, 103
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 190
LDI r12, 90
LDI r13, 180
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
