; DESCRIPTION: Composite: Creates a black rectangular region at (243, 126) spanning 106 by 117 pixels then Places a blue circle of radius 50 at center (439, 157).
; PLAN: r0=243(x), r1=126(y), r2=106(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=157(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 126
LDI r2, 106
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 157
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
