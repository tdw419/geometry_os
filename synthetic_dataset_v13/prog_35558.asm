; DESCRIPTION: Composite: Places a black line segment connecting (463, 142) to (135, 149) then Creates a magenta rectangular region at (146, 153) spanning 79 by 83 pixels then Sets a single cyan pixel at (453, 14).
; PLAN: r0=463(x1), r1=142(y1), r2=135(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=153(y), r7=79(width), r8=83(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=453(x), r11=14(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 463
LDI r1, 142
LDI r2, 135
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 153
LDI r7, 79
LDI r8, 83
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 14
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
