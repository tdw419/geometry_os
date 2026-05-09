; DESCRIPTION: Composite: Places a white dot at position (23, 180) then Draws a red line from (84, 106) to (362, 66) then Renders a green disk with center (299, 63) and radius 44.
; PLAN: r0=23(x), r1=180(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=84(x1), r6=106(y1), r7=362(x2), r8=66(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=63(y), r12=44(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 23
LDI r1, 180
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 84
LDI r6, 106
LDI r7, 362
LDI r8, 66
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 63
LDI r12, 44
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
