; DESCRIPTION: Composite: Sets a single red pixel at (383, 77) then Renders a white line between points (132, 141) and (486, 56) then Renders a orange box of size 87x59 starting at (57, 49).
; PLAN: r0=383(x), r1=77(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=132(x1), r6=141(y1), r7=486(x2), r8=56(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=57(x), r11=49(y), r12=87(width), r13=59(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 77
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 132
LDI r6, 141
LDI r7, 486
LDI r8, 56
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 49
LDI r12, 87
LDI r13, 59
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
