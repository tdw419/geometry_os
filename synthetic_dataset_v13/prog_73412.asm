; DESCRIPTION: Composite: Creates a blue rectangular region at (216, 10) spanning 49 by 30 pixels then Creates a cyan circular shape at (125, 51) with radius 27.
; PLAN: r0=216(x), r1=10(y), r2=49(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=51(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 216
LDI r1, 10
LDI r2, 49
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 51
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
