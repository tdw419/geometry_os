; DESCRIPTION: Composite: Draws a orange line from (49, 74) to (125, 58) then Renders a black box of size 16x119 starting at (64, 130) then Places a green dot at position (466, 166).
; PLAN: r0=49(x1), r1=74(y1), r2=125(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=130(y), r7=16(width), r8=119(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=466(x), r11=166(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 49
LDI r1, 74
LDI r2, 125
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 130
LDI r7, 16
LDI r8, 119
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 166
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
