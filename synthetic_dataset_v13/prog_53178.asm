; DESCRIPTION: Composite: Sets a single white pixel at (418, 30) then Renders a black box of size 106x73 starting at (350, 55) then Renders a blue disk with center (396, 102) and radius 60.
; PLAN: r0=418(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=55(y), r7=106(width), r8=73(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=396(x), r11=102(y), r12=60(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 30
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 55
LDI r7, 106
LDI r8, 73
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 102
LDI r12, 60
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
