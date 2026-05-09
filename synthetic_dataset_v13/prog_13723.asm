; DESCRIPTION: Composite: Places a black line segment connecting (95, 127) to (406, 7) then Creates a purple rectangular region at (97, 20) spanning 46 by 40 pixels.
; PLAN: r0=95(x1), r1=127(y1), r2=406(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=20(y), r7=46(width), r8=40(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 127
LDI r2, 406
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 20
LDI r7, 46
LDI r8, 40
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
