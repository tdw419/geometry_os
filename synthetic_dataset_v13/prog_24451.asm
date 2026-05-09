; DESCRIPTION: Composite: Sets a single magenta pixel at (451, 115) then Places a yellow 68x70 rectangle at position (15, 58) then Places a white line segment connecting (362, 217) to (29, 237).
; PLAN: r0=451(x), r1=115(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=15(x), r6=58(y), r7=68(width), r8=70(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=362(x1), r11=217(y1), r12=29(x2), r13=237(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 115
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 15
LDI r6, 58
LDI r7, 68
LDI r8, 70
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 217
LDI r12, 29
LDI r13, 237
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
