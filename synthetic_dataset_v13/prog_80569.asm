; DESCRIPTION: Composite: Draws a magenta line from (165, 131) to (19, 83) then Draws a cyan circle centered at (110, 185) with radius 65.
; PLAN: r0=165(x1), r1=131(y1), r2=19(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=185(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 131
LDI r2, 19
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 185
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
