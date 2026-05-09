; DESCRIPTION: Composite: Creates a red rectangular region at (220, 29) spanning 80 by 73 pixels then Draws a cyan circle centered at (246, 89) with radius 48.
; PLAN: r0=220(x), r1=29(y), r2=80(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=89(y), r7=48(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 29
LDI r2, 80
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 89
LDI r7, 48
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
