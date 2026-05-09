; DESCRIPTION: Composite: Places a cyan line segment connecting (39, 138) to (276, 103) then Draws a blue circle centered at (93, 101) with radius 68 then Sets a single yellow pixel at (48, 19).
; PLAN: r0=39(x1), r1=138(y1), r2=276(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=101(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=48(x), r11=19(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 138
LDI r2, 276
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 101
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 48
LDI r11, 19
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
