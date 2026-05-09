; DESCRIPTION: Composite: Renders a cyan disk with center (389, 100) and radius 66 then Creates a purple rectangular region at (105, 56) spanning 79 by 73 pixels.
; PLAN: r0=389(x), r1=100(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=56(y), r7=79(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 100
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 56
LDI r7, 79
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
