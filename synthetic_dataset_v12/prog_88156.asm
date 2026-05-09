; DESCRIPTION: Composite: Renders a cyan box of size 24x85 starting at (156, 140) then Sets a single blue pixel at (192, 75) then Places a orange line segment connecting (443, 231) to (162, 180).
; PLAN: r0=156(x), r1=140(y), r2=24(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=75(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=443(x1), r11=231(y1), r12=162(x2), r13=180(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 140
LDI r2, 24
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 75
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 443
LDI r11, 231
LDI r12, 162
LDI r13, 180
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
