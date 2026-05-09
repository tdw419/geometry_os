; DESCRIPTION: Composite: Draws a cyan circle centered at (190, 192) with radius 32 then Creates a magenta rectangular region at (219, 95) spanning 89 by 53 pixels then Renders a magenta line between points (13, 196) and (231, 204).
; PLAN: r0=190(x), r1=192(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=95(y), r7=89(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=13(x1), r11=196(y1), r12=231(x2), r13=204(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 192
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 95
LDI r7, 89
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 196
LDI r12, 231
LDI r13, 204
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
