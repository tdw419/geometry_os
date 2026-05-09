; DESCRIPTION: Composite: Creates a magenta circular shape at (248, 149) with radius 31 then Places a white 32x43 rectangle at position (102, 162) then Places a cyan line segment connecting (80, 34) to (109, 2).
; PLAN: r0=248(x), r1=149(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=162(y), r7=32(width), r8=43(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x1), r11=34(y1), r12=109(x2), r13=2(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 149
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 162
LDI r7, 32
LDI r8, 43
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 34
LDI r12, 109
LDI r13, 2
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
