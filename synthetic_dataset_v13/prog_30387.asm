; DESCRIPTION: Composite: Creates a orange rectangular region at (145, 49) spanning 43 by 47 pixels then Renders a orange disk with center (48, 177) and radius 38.
; PLAN: r0=145(x), r1=49(y), r2=43(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=48(x), r6=177(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 49
LDI r2, 43
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 177
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
