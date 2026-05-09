; DESCRIPTION: Composite: Sets a single cyan pixel at (30, 136) then Creates a blue rectangular region at (35, 14) spanning 53 by 77 pixels then Renders a green disk with center (494, 41) and radius 14.
; PLAN: r0=30(x), r1=136(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=35(x), r6=14(y), r7=53(width), r8=77(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=494(x), r11=41(y), r12=14(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 30
LDI r1, 136
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 35
LDI r6, 14
LDI r7, 53
LDI r8, 77
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 494
LDI r11, 41
LDI r12, 14
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
