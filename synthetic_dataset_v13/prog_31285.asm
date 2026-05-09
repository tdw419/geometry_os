; DESCRIPTION: Composite: Sets a single purple pixel at (22, 36) then Places a white circle of radius 16 at center (452, 179) then Draws a purple line from (106, 139) to (445, 57).
; PLAN: r0=22(x), r1=36(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=452(x), r6=179(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=106(x1), r11=139(y1), r12=445(x2), r13=57(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 36
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 452
LDI r6, 179
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 106
LDI r11, 139
LDI r12, 445
LDI r13, 57
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
