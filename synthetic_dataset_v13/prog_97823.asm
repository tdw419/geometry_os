; DESCRIPTION: Composite: Sets a single blue pixel at (430, 239) then Renders a black box of size 70x21 starting at (442, 19) then Places a black circle of radius 16 at center (352, 225).
; PLAN: r0=430(x), r1=239(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=19(y), r7=70(width), r8=21(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=352(x), r11=225(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 239
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 442
LDI r6, 19
LDI r7, 70
LDI r8, 21
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 225
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
