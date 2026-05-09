; DESCRIPTION: Composite: Places a red dot at position (379, 219) then Renders a red box of size 17x31 starting at (53, 4) then Renders a yellow disk with center (344, 164) and radius 71.
; PLAN: r0=379(x), r1=219(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=4(y), r7=17(width), r8=31(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x), r11=164(y), r12=71(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 379
LDI r1, 219
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 53
LDI r6, 4
LDI r7, 17
LDI r8, 31
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 164
LDI r12, 71
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
