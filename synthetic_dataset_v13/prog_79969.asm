; DESCRIPTION: Composite: Draws a blue line from (184, 107) to (210, 7) then Sets a single purple pixel at (126, 213) then Draws a blue rectangle at (215, 85) with width 43 and height 80.
; PLAN: r0=184(x1), r1=107(y1), r2=210(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=213(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=85(y), r12=43(width), r13=80(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 107
LDI r2, 210
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 213
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 85
LDI r12, 43
LDI r13, 80
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
