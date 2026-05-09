; DESCRIPTION: Composite: Creates a magenta circular shape at (30, 49) with radius 24 then Creates a cyan rectangular region at (177, 110) spanning 52 by 88 pixels then Places a cyan line segment connecting (365, 42) to (302, 205).
; PLAN: r0=30(x), r1=49(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=110(y), r7=52(width), r8=88(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x1), r11=42(y1), r12=302(x2), r13=205(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 49
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 110
LDI r7, 52
LDI r8, 88
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 42
LDI r12, 302
LDI r13, 205
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
