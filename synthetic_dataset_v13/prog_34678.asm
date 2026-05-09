; DESCRIPTION: Composite: Places a black line segment connecting (53, 205) to (488, 33) then Draws a cyan rectangle at (464, 85) with width 24 and height 53 then Sets a single purple pixel at (501, 191).
; PLAN: r0=53(x1), r1=205(y1), r2=488(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=85(y), r7=24(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=501(x), r11=191(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 205
LDI r2, 488
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 85
LDI r7, 24
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 501
LDI r11, 191
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
