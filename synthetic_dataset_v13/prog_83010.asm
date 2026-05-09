; DESCRIPTION: Composite: Places a blue line segment connecting (359, 239) to (19, 103) then Creates a yellow rectangular region at (271, 141) spanning 110 by 103 pixels.
; PLAN: r0=359(x1), r1=239(y1), r2=19(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=141(y), r7=110(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 239
LDI r2, 19
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 141
LDI r7, 110
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
