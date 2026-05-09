; DESCRIPTION: Composite: Creates a yellow circular shape at (100, 186) with radius 66 then Places a blue line segment connecting (232, 210) to (145, 110) then Places a cyan dot at position (98, 33).
; PLAN: r0=100(x), r1=186(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x1), r6=210(y1), r7=145(x2), r8=110(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=33(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 186
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 210
LDI r7, 145
LDI r8, 110
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 33
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
