; DESCRIPTION: Composite: Renders a magenta box of size 44x12 starting at (370, 40) then Places a blue dot at position (302, 125) then Places a black line segment connecting (29, 159) to (380, 144).
; PLAN: r0=370(x), r1=40(y), r2=44(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=125(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=29(x1), r11=159(y1), r12=380(x2), r13=144(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 40
LDI r2, 44
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 125
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 29
LDI r11, 159
LDI r12, 380
LDI r13, 144
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
