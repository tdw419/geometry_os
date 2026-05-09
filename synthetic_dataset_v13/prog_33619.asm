; DESCRIPTION: Composite: Draws a orange line from (370, 23) to (59, 44) then Creates a cyan circular shape at (170, 63) with radius 14.
; PLAN: r0=370(x1), r1=23(y1), r2=59(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=63(y), r7=14(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 370
LDI r1, 23
LDI r2, 59
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 63
LDI r7, 14
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
