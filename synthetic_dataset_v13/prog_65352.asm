; DESCRIPTION: Composite: Renders a red line between points (53, 167) and (315, 243) then Places a magenta dot at position (500, 199) then Draws a green rectangle at (215, 35) with width 18 and height 44.
; PLAN: r0=53(x1), r1=167(y1), r2=315(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=500(x), r6=199(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=35(y), r12=18(width), r13=44(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 167
LDI r2, 315
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 500
LDI r6, 199
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 35
LDI r12, 18
LDI r13, 44
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
