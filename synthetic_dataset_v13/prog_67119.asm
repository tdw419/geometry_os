; DESCRIPTION: Composite: Draws a cyan rectangle at (161, 117) with width 84 and height 116 then Places a blue line segment connecting (288, 117) to (324, 40) then Sets a single red pixel at (27, 134).
; PLAN: r0=161(x), r1=117(y), r2=84(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x1), r6=117(y1), r7=324(x2), r8=40(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=27(x), r11=134(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 161
LDI r1, 117
LDI r2, 84
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 117
LDI r7, 324
LDI r8, 40
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 134
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
