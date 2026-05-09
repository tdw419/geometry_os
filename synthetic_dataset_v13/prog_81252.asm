; DESCRIPTION: Composite: Draws a cyan line from (110, 200) to (458, 82) then Creates a cyan rectangular region at (267, 133) spanning 28 by 56 pixels then Creates a yellow circular shape at (52, 49) with radius 20.
; PLAN: r0=110(x1), r1=200(y1), r2=458(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=133(y), r7=28(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=52(x), r11=49(y), r12=20(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 110
LDI r1, 200
LDI r2, 458
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 133
LDI r7, 28
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 49
LDI r12, 20
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
