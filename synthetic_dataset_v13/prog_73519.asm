; DESCRIPTION: Composite: Creates a blue rectangular region at (143, 3) spanning 120 by 86 pixels then Places a red circle of radius 24 at center (360, 138).
; PLAN: r0=143(x), r1=3(y), r2=120(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=138(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 3
LDI r2, 120
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 138
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
