; DESCRIPTION: Composite: Creates a red rectangular region at (308, 45) spanning 58 by 104 pixels then Draws a cyan circle centered at (117, 70) with radius 45.
; PLAN: r0=308(x), r1=45(y), r2=58(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=70(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 308
LDI r1, 45
LDI r2, 58
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 70
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
