; DESCRIPTION: Composite: Places a white dot at position (307, 35) then Places a cyan 110x35 rectangle at position (352, 136) then Renders a orange disk with center (358, 127) and radius 58.
; PLAN: r0=307(x), r1=35(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=136(y), r7=110(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=358(x), r11=127(y), r12=58(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 35
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 136
LDI r7, 110
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 127
LDI r12, 58
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
