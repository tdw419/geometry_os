; DESCRIPTION: Composite: Draws a blue line from (255, 57) to (292, 176) then Creates a yellow rectangular region at (284, 185) spanning 87 by 64 pixels.
; PLAN: r0=255(x1), r1=57(y1), r2=292(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=185(y), r7=87(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 57
LDI r2, 292
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 185
LDI r7, 87
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
