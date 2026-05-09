; DESCRIPTION: Composite: Draws a orange rectangle at (236, 75) with width 49 and height 101 then Renders a blue line between points (256, 120) and (290, 229) then Places a white dot at position (376, 151).
; PLAN: r0=236(x), r1=75(y), r2=49(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x1), r6=120(y1), r7=290(x2), r8=229(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=376(x), r11=151(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 75
LDI r2, 49
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 120
LDI r7, 290
LDI r8, 229
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 151
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
