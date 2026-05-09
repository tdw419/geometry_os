; DESCRIPTION: Composite: Draws a black rectangle at (435, 100) with width 45 and height 111 then Sets a single cyan pixel at (432, 88).
; PLAN: r0=435(x), r1=100(y), r2=45(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=88(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 435
LDI r1, 100
LDI r2, 45
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 88
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
