; DESCRIPTION: Composite: Draws a orange line from (139, 64) to (279, 234) then Draws a cyan circle centered at (395, 80) with radius 77.
; PLAN: r0=139(x1), r1=64(y1), r2=279(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=80(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 139
LDI r1, 64
LDI r2, 279
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 80
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
