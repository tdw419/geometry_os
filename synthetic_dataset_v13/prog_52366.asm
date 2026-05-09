; DESCRIPTION: Composite: Creates a magenta rectangular region at (154, 118) spanning 55 by 59 pixels then Draws a magenta line from (481, 49) to (360, 237) then Sets a single cyan pixel at (3, 26).
; PLAN: r0=154(x), r1=118(y), r2=55(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x1), r6=49(y1), r7=360(x2), r8=237(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=3(x), r11=26(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 118
LDI r2, 55
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 49
LDI r7, 360
LDI r8, 237
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 26
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
