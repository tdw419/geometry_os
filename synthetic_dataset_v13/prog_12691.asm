; DESCRIPTION: Composite: Places a cyan line segment connecting (70, 226) to (460, 214) then Draws a green rectangle at (85, 5) with width 57 and height 101 then Sets a single magenta pixel at (119, 145).
; PLAN: r0=70(x1), r1=226(y1), r2=460(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=5(y), r7=57(width), r8=101(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=119(x), r11=145(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 70
LDI r1, 226
LDI r2, 460
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 5
LDI r7, 57
LDI r8, 101
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 145
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
