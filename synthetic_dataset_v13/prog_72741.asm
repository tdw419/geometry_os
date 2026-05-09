; DESCRIPTION: Composite: Places a purple dot at position (361, 74) then Draws a blue circle centered at (374, 66) with radius 27 then Places a blue line segment connecting (488, 178) to (94, 76).
; PLAN: r0=361(x), r1=74(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=66(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=488(x1), r11=178(y1), r12=94(x2), r13=76(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 74
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 66
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 488
LDI r11, 178
LDI r12, 94
LDI r13, 76
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
