; DESCRIPTION: Composite: Draws a blue line from (98, 44) to (155, 209) then Places a black 12x98 rectangle at position (159, 77) then Renders a cyan disk with center (67, 76) and radius 60.
; PLAN: r0=98(x1), r1=44(y1), r2=155(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=77(y), r7=12(width), r8=98(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x), r11=76(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 98
LDI r1, 44
LDI r2, 155
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 77
LDI r7, 12
LDI r8, 98
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 76
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
