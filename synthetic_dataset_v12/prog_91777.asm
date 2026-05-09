; DESCRIPTION: Composite: Places a red line segment connecting (450, 101) to (239, 179) then Sets a single green pixel at (6, 152) then Draws a cyan circle centered at (185, 128) with radius 60.
; PLAN: r0=450(x1), r1=101(y1), r2=239(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=152(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=185(x), r11=128(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 450
LDI r1, 101
LDI r2, 239
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 152
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 185
LDI r11, 128
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
