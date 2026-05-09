; DESCRIPTION: Composite: Creates a orange rectangular region at (117, 58) spanning 46 by 118 pixels then Places a magenta circle of radius 31 at center (423, 154).
; PLAN: r0=117(x), r1=58(y), r2=46(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=154(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 117
LDI r1, 58
LDI r2, 46
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 154
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
