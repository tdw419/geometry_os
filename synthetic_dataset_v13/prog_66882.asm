; DESCRIPTION: Composite: Places a orange line segment connecting (406, 146) to (108, 30) then Creates a cyan rectangular region at (162, 79) spanning 96 by 72 pixels then Places a yellow dot at position (113, 248).
; PLAN: r0=406(x1), r1=146(y1), r2=108(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=79(y), r7=96(width), r8=72(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=113(x), r11=248(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 406
LDI r1, 146
LDI r2, 108
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 79
LDI r7, 96
LDI r8, 72
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 248
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
