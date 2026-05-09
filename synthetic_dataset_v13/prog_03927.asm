; DESCRIPTION: Composite: Renders a blue line between points (360, 225) and (150, 156) then Sets a single magenta pixel at (60, 93) then Draws a orange rectangle at (0, 148) with width 21 and height 65.
; PLAN: r0=360(x1), r1=225(y1), r2=150(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=93(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=0(x), r11=148(y), r12=21(width), r13=65(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 225
LDI r2, 150
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 93
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 0
LDI r11, 148
LDI r12, 21
LDI r13, 65
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
