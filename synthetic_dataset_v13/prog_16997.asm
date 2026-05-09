; DESCRIPTION: Composite: Renders a white disk with center (254, 214) and radius 28 then Places a purple line segment connecting (131, 176) to (239, 190) then Creates a orange rectangular region at (386, 31) spanning 44 by 41 pixels.
; PLAN: r0=254(x), r1=214(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x1), r6=176(y1), r7=239(x2), r8=190(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=31(y), r12=44(width), r13=41(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 214
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 176
LDI r7, 239
LDI r8, 190
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 31
LDI r12, 44
LDI r13, 41
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
