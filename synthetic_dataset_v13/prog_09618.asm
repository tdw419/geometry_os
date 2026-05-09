; DESCRIPTION: Composite: Renders a orange disk with center (145, 195) and radius 46 then Places a cyan dot at position (158, 177) then Draws a blue rectangle at (97, 193) with width 99 and height 18.
; PLAN: r0=145(x), r1=195(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=177(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=97(x), r11=193(y), r12=99(width), r13=18(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 195
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 177
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 97
LDI r11, 193
LDI r12, 99
LDI r13, 18
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
