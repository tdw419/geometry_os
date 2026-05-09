; DESCRIPTION: Composite: Places a cyan line segment connecting (168, 23) to (217, 16) then Places a yellow dot at position (199, 156) then Draws a blue rectangle at (461, 90) with width 35 and height 100.
; PLAN: r0=168(x1), r1=23(y1), r2=217(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=156(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=461(x), r11=90(y), r12=35(width), r13=100(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 23
LDI r2, 217
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 156
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 461
LDI r11, 90
LDI r12, 35
LDI r13, 100
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
