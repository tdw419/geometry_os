; DESCRIPTION: Composite: Places a magenta 10x104 rectangle at position (411, 72) then Places a orange circle of radius 63 at center (133, 130).
; PLAN: r0=411(x), r1=72(y), r2=10(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x), r6=130(y), r7=63(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 72
LDI r2, 10
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 130
LDI r7, 63
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
