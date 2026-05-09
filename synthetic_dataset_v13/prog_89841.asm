; DESCRIPTION: Composite: Creates a yellow rectangular region at (56, 113) spanning 28 by 119 pixels then Draws a white line from (128, 196) to (170, 254).
; PLAN: r0=56(x), r1=113(y), r2=28(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x1), r6=196(y1), r7=170(x2), r8=254(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 56
LDI r1, 113
LDI r2, 28
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 196
LDI r7, 170
LDI r8, 254
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
