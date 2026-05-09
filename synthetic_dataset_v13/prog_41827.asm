; DESCRIPTION: Composite: Places a yellow dot at position (136, 117) then Places a cyan 116x62 rectangle at position (184, 184) then Renders a cyan disk with center (421, 79) and radius 68.
; PLAN: r0=136(x), r1=117(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=184(y), r7=116(width), r8=62(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=421(x), r11=79(y), r12=68(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 136
LDI r1, 117
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 184
LDI r6, 184
LDI r7, 116
LDI r8, 62
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 79
LDI r12, 68
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
