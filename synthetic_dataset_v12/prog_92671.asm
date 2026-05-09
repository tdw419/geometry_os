; DESCRIPTION: Composite: Renders a blue box of size 50x46 starting at (91, 164) then Renders a purple disk with center (184, 40) and radius 40 then Sets a single purple pixel at (247, 31).
; PLAN: r0=91(x), r1=164(y), r2=50(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=40(y), r7=40(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=247(x), r11=31(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 164
LDI r2, 50
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 40
LDI r7, 40
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 247
LDI r11, 31
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
