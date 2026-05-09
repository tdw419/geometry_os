; DESCRIPTION: Composite: Draws a orange circle centered at (80, 81) with radius 74 then Draws a magenta line from (194, 238) to (26, 31) then Places a cyan dot at position (218, 234).
; PLAN: r0=80(x), r1=81(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x1), r6=238(y1), r7=26(x2), r8=31(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=218(x), r11=234(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 81
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 238
LDI r7, 26
LDI r8, 31
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 234
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
