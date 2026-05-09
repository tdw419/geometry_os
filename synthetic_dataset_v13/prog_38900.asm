; DESCRIPTION: Composite: Places a blue line segment connecting (172, 95) to (99, 253) then Renders a orange box of size 106x96 starting at (61, 68) then Sets a single green pixel at (249, 161).
; PLAN: r0=172(x1), r1=95(y1), r2=99(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=68(y), r7=106(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=249(x), r11=161(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 172
LDI r1, 95
LDI r2, 99
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 68
LDI r7, 106
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 161
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
