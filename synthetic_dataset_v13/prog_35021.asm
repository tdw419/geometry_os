; DESCRIPTION: Composite: Creates a magenta rectangular region at (470, 121) spanning 20 by 46 pixels then Places a yellow line segment connecting (293, 222) to (208, 101).
; PLAN: r0=470(x), r1=121(y), r2=20(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x1), r6=222(y1), r7=208(x2), r8=101(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 121
LDI r2, 20
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 222
LDI r7, 208
LDI r8, 101
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
