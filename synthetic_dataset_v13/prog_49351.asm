; DESCRIPTION: Composite: Draws a green line from (492, 122) to (101, 253) then Draws a purple rectangle at (185, 116) with width 45 and height 24 then Places a white dot at position (51, 48).
; PLAN: r0=492(x1), r1=122(y1), r2=101(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=116(y), r7=45(width), r8=24(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=51(x), r11=48(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 492
LDI r1, 122
LDI r2, 101
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 116
LDI r7, 45
LDI r8, 24
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 48
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
