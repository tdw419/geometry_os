; DESCRIPTION: Composite: Sets a single purple pixel at (44, 73) then Places a red circle of radius 38 at center (315, 186) then Places a white line segment connecting (454, 28) to (224, 30).
; PLAN: r0=44(x), r1=73(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=186(y), r7=38(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=454(x1), r11=28(y1), r12=224(x2), r13=30(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 73
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 315
LDI r6, 186
LDI r7, 38
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 454
LDI r11, 28
LDI r12, 224
LDI r13, 30
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
