; DESCRIPTION: Composite: Creates a red circular shape at (382, 36) with radius 15 then Sets a single purple pixel at (477, 146) then Places a white line segment connecting (84, 16) to (20, 169).
; PLAN: r0=382(x), r1=36(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x), r6=146(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=84(x1), r11=16(y1), r12=20(x2), r13=169(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 36
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 146
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 84
LDI r11, 16
LDI r12, 20
LDI r13, 169
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
