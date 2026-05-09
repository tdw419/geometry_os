; DESCRIPTION: Composite: Renders a blue line between points (265, 57) and (336, 196) then Places a white dot at position (118, 230) then Draws a yellow rectangle at (292, 164) with width 55 and height 14.
; PLAN: r0=265(x1), r1=57(y1), r2=336(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=230(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=292(x), r11=164(y), r12=55(width), r13=14(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 57
LDI r2, 336
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 230
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 292
LDI r11, 164
LDI r12, 55
LDI r13, 14
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
