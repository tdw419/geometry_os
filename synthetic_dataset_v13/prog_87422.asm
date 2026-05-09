; DESCRIPTION: Composite: Creates a orange rectangular region at (148, 88) spanning 18 by 35 pixels then Renders a cyan disk with center (275, 210) and radius 24.
; PLAN: r0=148(x), r1=88(y), r2=18(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=210(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 148
LDI r1, 88
LDI r2, 18
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 210
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
