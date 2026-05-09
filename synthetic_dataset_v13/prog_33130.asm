; DESCRIPTION: Composite: Draws a cyan rectangle at (28, 86) with width 44 and height 55 then Places a blue dot at position (431, 155) then Renders a purple disk with center (158, 196) and radius 27.
; PLAN: r0=28(x), r1=86(y), r2=44(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=155(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=196(y), r12=27(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 28
LDI r1, 86
LDI r2, 44
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 155
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 158
LDI r11, 196
LDI r12, 27
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
