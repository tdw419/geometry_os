; DESCRIPTION: Composite: Draws a black rectangle at (300, 3) with width 40 and height 109 then Places a blue dot at position (200, 35) then Renders a cyan line between points (107, 43) and (253, 241).
; PLAN: r0=300(x), r1=3(y), r2=40(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=35(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=107(x1), r11=43(y1), r12=253(x2), r13=241(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 3
LDI r2, 40
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 35
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 107
LDI r11, 43
LDI r12, 253
LDI r13, 241
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
