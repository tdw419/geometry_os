; DESCRIPTION: Composite: Renders a red box of size 118x28 starting at (50, 220) then Sets a single cyan pixel at (328, 96) then Renders a cyan disk with center (73, 138) and radius 15.
; PLAN: r0=50(x), r1=220(y), r2=118(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=96(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=73(x), r11=138(y), r12=15(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 50
LDI r1, 220
LDI r2, 118
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 96
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 73
LDI r11, 138
LDI r12, 15
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
