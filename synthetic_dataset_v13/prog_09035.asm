; DESCRIPTION: Composite: Places a magenta dot at position (197, 105) then Creates a cyan circular shape at (39, 44) with radius 10 then Places a cyan line segment connecting (432, 32) to (451, 157).
; PLAN: r0=197(x), r1=105(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=39(x), r6=44(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=432(x1), r11=32(y1), r12=451(x2), r13=157(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 105
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 39
LDI r6, 44
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 432
LDI r11, 32
LDI r12, 451
LDI r13, 157
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
