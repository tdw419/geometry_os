; DESCRIPTION: Composite: Creates a black circular shape at (356, 100) with radius 64 then Draws a magenta line from (306, 177) to (398, 254) then Renders a green box of size 110x107 starting at (133, 38).
; PLAN: r0=356(x), r1=100(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x1), r6=177(y1), r7=398(x2), r8=254(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=133(x), r11=38(y), r12=110(width), r13=107(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 100
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 177
LDI r7, 398
LDI r8, 254
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 38
LDI r12, 110
LDI r13, 107
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
