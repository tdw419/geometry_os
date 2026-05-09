; DESCRIPTION: Composite: Draws a purple rectangle at (394, 30) with width 79 and height 115 then Creates a red circular shape at (456, 82) with radius 48.
; PLAN: r0=394(x), r1=30(y), r2=79(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=82(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 30
LDI r2, 79
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 82
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
