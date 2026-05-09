; DESCRIPTION: Composite: Renders a black box of size 78x102 starting at (394, 2) then Sets a single blue pixel at (490, 45) then Places a green circle of radius 16 at center (451, 146).
; PLAN: r0=394(x), r1=2(y), r2=78(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=45(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=451(x), r11=146(y), r12=16(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 394
LDI r1, 2
LDI r2, 78
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 45
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 451
LDI r11, 146
LDI r12, 16
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
