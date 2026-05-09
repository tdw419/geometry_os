; DESCRIPTION: Composite: Draws a blue circle centered at (210, 173) with radius 78 then Renders a orange line between points (174, 236) and (341, 80) then Places a red dot at position (313, 157).
; PLAN: r0=210(x), r1=173(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x1), r6=236(y1), r7=341(x2), r8=80(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=313(x), r11=157(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 210
LDI r1, 173
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 236
LDI r7, 341
LDI r8, 80
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 157
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
