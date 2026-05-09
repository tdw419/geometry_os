; DESCRIPTION: Composite: Renders a black disk with center (208, 153) and radius 32 then Draws a black rectangle at (149, 115) with width 63 and height 12 then Places a cyan dot at position (48, 194).
; PLAN: r0=208(x), r1=153(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x), r6=115(y), r7=63(width), r8=12(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=48(x), r11=194(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 208
LDI r1, 153
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 115
LDI r7, 63
LDI r8, 12
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 48
LDI r11, 194
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
