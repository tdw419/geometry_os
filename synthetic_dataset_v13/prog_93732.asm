; DESCRIPTION: Composite: Places a green 48x76 rectangle at position (212, 62) then Places a green dot at position (283, 244) then Places a blue line segment connecting (344, 199) to (135, 192).
; PLAN: r0=212(x), r1=62(y), r2=48(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=244(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=344(x1), r11=199(y1), r12=135(x2), r13=192(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 62
LDI r2, 48
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 244
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 344
LDI r11, 199
LDI r12, 135
LDI r13, 192
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
