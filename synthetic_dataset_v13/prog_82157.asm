; DESCRIPTION: Composite: Renders a orange box of size 61x66 starting at (195, 112) then Places a magenta line segment connecting (196, 121) to (160, 252) then Sets a single cyan pixel at (23, 185).
; PLAN: r0=195(x), r1=112(y), r2=61(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x1), r6=121(y1), r7=160(x2), r8=252(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=23(x), r11=185(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 112
LDI r2, 61
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 121
LDI r7, 160
LDI r8, 252
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 185
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
