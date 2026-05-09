; DESCRIPTION: Composite: Places a blue dot at position (446, 205) then Draws a orange line from (331, 144) to (42, 156) then Places a green circle of radius 20 at center (101, 120).
; PLAN: r0=446(x), r1=205(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=144(y1), r7=42(x2), r8=156(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=120(y), r12=20(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 446
LDI r1, 205
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 331
LDI r6, 144
LDI r7, 42
LDI r8, 156
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 120
LDI r12, 20
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
