; DESCRIPTION: Composite: Draws a yellow rectangle at (44, 43) with width 30 and height 74 then Sets a single purple pixel at (14, 200) then Draws a green line from (118, 128) to (200, 134).
; PLAN: r0=44(x), r1=43(y), r2=30(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x), r6=200(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=118(x1), r11=128(y1), r12=200(x2), r13=134(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 43
LDI r2, 30
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 200
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 118
LDI r11, 128
LDI r12, 200
LDI r13, 134
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
