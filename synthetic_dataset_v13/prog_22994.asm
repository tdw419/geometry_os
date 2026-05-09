; DESCRIPTION: Composite: Sets a single blue pixel at (64, 9) then Places a black line segment connecting (226, 9) to (74, 226) then Places a blue 13x53 rectangle at position (130, 200).
; PLAN: r0=64(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=226(x1), r6=9(y1), r7=74(x2), r8=226(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=130(x), r11=200(y), r12=13(width), r13=53(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 9
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 226
LDI r6, 9
LDI r7, 74
LDI r8, 226
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 200
LDI r12, 13
LDI r13, 53
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
