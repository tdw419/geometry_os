; DESCRIPTION: Composite: Places a red line segment connecting (300, 2) to (337, 8) then Creates a cyan rectangular region at (428, 61) spanning 77 by 114 pixels then Places a red circle of radius 49 at center (135, 117).
; PLAN: r0=300(x1), r1=2(y1), r2=337(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=61(y), r7=77(width), r8=114(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=135(x), r11=117(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 2
LDI r2, 337
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 61
LDI r7, 77
LDI r8, 114
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 117
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
