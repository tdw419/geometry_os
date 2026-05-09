; DESCRIPTION: Composite: Renders a purple disk with center (174, 169) and radius 47 then Places a magenta dot at position (380, 44) then Draws a green rectangle at (68, 70) with width 100 and height 93.
; PLAN: r0=174(x), r1=169(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x), r6=44(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=68(x), r11=70(y), r12=100(width), r13=93(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 169
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 44
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 68
LDI r11, 70
LDI r12, 100
LDI r13, 93
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
