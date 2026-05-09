; DESCRIPTION: Composite: Draws a blue line from (74, 209) to (251, 79) then Creates a orange circular shape at (377, 77) with radius 27 then Places a green dot at position (370, 85).
; PLAN: r0=74(x1), r1=209(y1), r2=251(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=77(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=85(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 74
LDI r1, 209
LDI r2, 251
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 77
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 85
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
