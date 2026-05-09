; DESCRIPTION: Composite: Renders a orange box of size 109x16 starting at (299, 94) then Renders a blue line between points (321, 103) and (331, 218) then Sets a single white pixel at (91, 158).
; PLAN: r0=299(x), r1=94(y), r2=109(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=103(y1), r7=331(x2), r8=218(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=91(x), r11=158(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 299
LDI r1, 94
LDI r2, 109
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 103
LDI r7, 331
LDI r8, 218
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 158
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
