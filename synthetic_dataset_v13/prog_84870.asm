; DESCRIPTION: Composite: Creates a cyan rectangular region at (257, 75) spanning 10 by 100 pixels then Places a yellow line segment connecting (438, 12) to (500, 53) then Sets a single magenta pixel at (135, 241).
; PLAN: r0=257(x), r1=75(y), r2=10(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x1), r6=12(y1), r7=500(x2), r8=53(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=135(x), r11=241(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 75
LDI r2, 10
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 12
LDI r7, 500
LDI r8, 53
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 241
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
