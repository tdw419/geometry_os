; DESCRIPTION: Composite: Creates a orange rectangular region at (42, 168) spanning 26 by 30 pixels then Places a black circle of radius 24 at center (399, 182) then Places a black line segment connecting (266, 42) to (489, 45).
; PLAN: r0=42(x), r1=168(y), r2=26(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x), r6=182(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=266(x1), r11=42(y1), r12=489(x2), r13=45(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 168
LDI r2, 26
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 182
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 266
LDI r11, 42
LDI r12, 489
LDI r13, 45
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
