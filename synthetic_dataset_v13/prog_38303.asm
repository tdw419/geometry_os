; DESCRIPTION: Composite: Creates a red rectangular region at (104, 179) spanning 87 by 28 pixels then Places a yellow circle of radius 38 at center (402, 117).
; PLAN: r0=104(x), r1=179(y), r2=87(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=117(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 104
LDI r1, 179
LDI r2, 87
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 117
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
