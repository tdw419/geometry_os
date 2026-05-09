; DESCRIPTION: Composite: Renders a white box of size 43x12 starting at (293, 69) then Places a blue dot at position (232, 160) then Renders a cyan line between points (455, 171) and (17, 253).
; PLAN: r0=293(x), r1=69(y), r2=43(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x), r6=160(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=455(x1), r11=171(y1), r12=17(x2), r13=253(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 69
LDI r2, 43
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 160
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 455
LDI r11, 171
LDI r12, 17
LDI r13, 253
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
