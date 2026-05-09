; DESCRIPTION: Composite: Sets a single magenta pixel at (492, 209) then Places a purple line segment connecting (296, 94) to (492, 213) then Places a black 90x95 rectangle at position (77, 19).
; PLAN: r0=492(x), r1=209(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=296(x1), r6=94(y1), r7=492(x2), r8=213(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=19(y), r12=90(width), r13=95(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 492
LDI r1, 209
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 94
LDI r7, 492
LDI r8, 213
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 19
LDI r12, 90
LDI r13, 95
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
