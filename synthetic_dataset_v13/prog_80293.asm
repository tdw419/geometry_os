; DESCRIPTION: Composite: Places a yellow dot at position (374, 32) then Renders a magenta line between points (14, 86) and (180, 205) then Renders a purple disk with center (408, 59) and radius 40.
; PLAN: r0=374(x), r1=32(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=14(x1), r6=86(y1), r7=180(x2), r8=205(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=59(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 374
LDI r1, 32
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 14
LDI r6, 86
LDI r7, 180
LDI r8, 205
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 59
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
