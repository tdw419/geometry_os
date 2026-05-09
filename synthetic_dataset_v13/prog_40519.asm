; DESCRIPTION: Composite: Creates a cyan rectangular region at (211, 57) spanning 27 by 100 pixels then Renders a purple disk with center (434, 77) and radius 62.
; PLAN: r0=211(x), r1=57(y), r2=27(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=77(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 211
LDI r1, 57
LDI r2, 27
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 77
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
