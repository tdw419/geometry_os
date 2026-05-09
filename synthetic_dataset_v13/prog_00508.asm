; DESCRIPTION: Composite: Places a yellow line segment connecting (96, 27) to (292, 93) then Places a magenta dot at position (409, 112) then Draws a green circle centered at (131, 167) with radius 62.
; PLAN: r0=96(x1), r1=27(y1), r2=292(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=112(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=131(x), r11=167(y), r12=62(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 96
LDI r1, 27
LDI r2, 292
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 112
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 131
LDI r11, 167
LDI r12, 62
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
