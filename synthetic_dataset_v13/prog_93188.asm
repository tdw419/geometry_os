; DESCRIPTION: Composite: Creates a green circular shape at (390, 105) with radius 59 then Draws a blue line from (366, 196) to (490, 204) then Places a blue dot at position (180, 37).
; PLAN: r0=390(x), r1=105(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x1), r6=196(y1), r7=490(x2), r8=204(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=180(x), r11=37(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 105
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 196
LDI r7, 490
LDI r8, 204
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 37
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
