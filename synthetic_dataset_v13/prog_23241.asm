; DESCRIPTION: Composite: Draws a purple line from (271, 184) to (353, 69) then Creates a green rectangular region at (373, 76) spanning 109 by 32 pixels.
; PLAN: r0=271(x1), r1=184(y1), r2=353(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=76(y), r7=109(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 184
LDI r2, 353
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 76
LDI r7, 109
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
