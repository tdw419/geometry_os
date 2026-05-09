; DESCRIPTION: Composite: Places a blue dot at position (96, 84) then Draws a orange line from (242, 171) to (129, 171) then Creates a cyan circular shape at (236, 116) with radius 45.
; PLAN: r0=96(x), r1=84(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=242(x1), r6=171(y1), r7=129(x2), r8=171(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=236(x), r11=116(y), r12=45(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 96
LDI r1, 84
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 171
LDI r7, 129
LDI r8, 171
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 116
LDI r12, 45
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
