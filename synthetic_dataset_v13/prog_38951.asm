; DESCRIPTION: Composite: Draws a white line from (420, 24) to (44, 180) then Sets a single yellow pixel at (49, 19) then Draws a cyan circle centered at (373, 73) with radius 69.
; PLAN: r0=420(x1), r1=24(y1), r2=44(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=19(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=373(x), r11=73(y), r12=69(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 420
LDI r1, 24
LDI r2, 44
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 19
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 373
LDI r11, 73
LDI r12, 69
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
