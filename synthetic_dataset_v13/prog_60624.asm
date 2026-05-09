; DESCRIPTION: Composite: Renders a blue box of size 86x85 starting at (408, 160) then Places a red line segment connecting (106, 122) to (330, 209) then Sets a single cyan pixel at (51, 128).
; PLAN: r0=408(x), r1=160(y), r2=86(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x1), r6=122(y1), r7=330(x2), r8=209(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=128(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 160
LDI r2, 86
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 122
LDI r7, 330
LDI r8, 209
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 128
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
