; DESCRIPTION: Composite: Draws a cyan rectangle at (159, 76) with width 95 and height 109 then Places a white dot at position (488, 253) then Draws a red line from (266, 158) to (32, 180).
; PLAN: r0=159(x), r1=76(y), r2=95(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x), r6=253(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=266(x1), r11=158(y1), r12=32(x2), r13=180(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 76
LDI r2, 95
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 253
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 266
LDI r11, 158
LDI r12, 32
LDI r13, 180
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
