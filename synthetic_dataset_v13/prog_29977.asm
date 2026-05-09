; DESCRIPTION: Composite: Places a green dot at position (20, 101) then Places a cyan 120x55 rectangle at position (207, 185) then Renders a purple disk with center (319, 157) and radius 71.
; PLAN: r0=20(x), r1=101(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=185(y), r7=120(width), r8=55(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=157(y), r12=71(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 101
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 207
LDI r6, 185
LDI r7, 120
LDI r8, 55
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 157
LDI r12, 71
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
