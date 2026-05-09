; DESCRIPTION: Composite: Draws a green rectangle at (158, 7) with width 45 and height 71 then Places a green line segment connecting (17, 28) to (215, 181) then Places a green dot at position (507, 131).
; PLAN: r0=158(x), r1=7(y), r2=45(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x1), r6=28(y1), r7=215(x2), r8=181(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=507(x), r11=131(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 158
LDI r1, 7
LDI r2, 45
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 28
LDI r7, 215
LDI r8, 181
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 131
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
