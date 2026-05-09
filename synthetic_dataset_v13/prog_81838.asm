; DESCRIPTION: Composite: Places a magenta line segment connecting (487, 146) to (84, 169) then Draws a magenta circle centered at (359, 118) with radius 11 then Places a orange dot at position (479, 213).
; PLAN: r0=487(x1), r1=146(y1), r2=84(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=118(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=479(x), r11=213(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 487
LDI r1, 146
LDI r2, 84
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 118
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 479
LDI r11, 213
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
