; DESCRIPTION: Composite: Draws a yellow line from (74, 209) to (136, 6) then Draws a magenta rectangle at (319, 150) with width 119 and height 25 then Sets a single purple pixel at (480, 108).
; PLAN: r0=74(x1), r1=209(y1), r2=136(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=150(y), r7=119(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=480(x), r11=108(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 74
LDI r1, 209
LDI r2, 136
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 150
LDI r7, 119
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 480
LDI r11, 108
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
