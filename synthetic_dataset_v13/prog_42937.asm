; DESCRIPTION: Composite: Places a yellow dot at position (471, 45) then Renders a orange line between points (91, 23) and (34, 162) then Draws a cyan circle centered at (371, 67) with radius 24.
; PLAN: r0=471(x), r1=45(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=91(x1), r6=23(y1), r7=34(x2), r8=162(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=67(y), r12=24(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 471
LDI r1, 45
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 91
LDI r6, 23
LDI r7, 34
LDI r8, 162
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 67
LDI r12, 24
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
