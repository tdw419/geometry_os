; DESCRIPTION: Composite: Renders a cyan box of size 48x16 starting at (133, 6) then Creates a magenta circular shape at (177, 115) with radius 70 then Places a cyan line segment connecting (60, 227) to (69, 234).
; PLAN: r0=133(x), r1=6(y), r2=48(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x), r6=115(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x1), r11=227(y1), r12=69(x2), r13=234(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 6
LDI r2, 48
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 115
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 227
LDI r12, 69
LDI r13, 234
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
