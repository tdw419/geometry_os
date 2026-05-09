; DESCRIPTION: Composite: Draws a magenta line from (431, 151) to (445, 201) then Creates a orange rectangular region at (435, 13) spanning 58 by 16 pixels then Sets a single yellow pixel at (120, 118).
; PLAN: r0=431(x1), r1=151(y1), r2=445(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=13(y), r7=58(width), r8=16(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=120(x), r11=118(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 431
LDI r1, 151
LDI r2, 445
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 13
LDI r7, 58
LDI r8, 16
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 118
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
