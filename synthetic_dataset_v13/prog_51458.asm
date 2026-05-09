; DESCRIPTION: Composite: Places a purple dot at position (80, 21) then Renders a blue box of size 88x14 starting at (15, 209) then Renders a red disk with center (228, 158) and radius 74.
; PLAN: r0=80(x), r1=21(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=15(x), r6=209(y), r7=88(width), r8=14(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=228(x), r11=158(y), r12=74(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 80
LDI r1, 21
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 15
LDI r6, 209
LDI r7, 88
LDI r8, 14
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 158
LDI r12, 74
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
