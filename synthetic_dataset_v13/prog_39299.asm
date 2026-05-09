; DESCRIPTION: Composite: Renders a black box of size 28x63 starting at (383, 134) then Sets a single blue pixel at (443, 137) then Renders a black disk with center (215, 150) and radius 34.
; PLAN: r0=383(x), r1=134(y), r2=28(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=137(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=150(y), r12=34(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 383
LDI r1, 134
LDI r2, 28
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 137
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 150
LDI r12, 34
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
