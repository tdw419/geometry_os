; DESCRIPTION: Composite: Creates a orange rectangular region at (407, 105) spanning 41 by 105 pixels then Renders a orange disk with center (425, 59) and radius 16.
; PLAN: r0=407(x), r1=105(y), r2=41(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x), r6=59(y), r7=16(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 105
LDI r2, 41
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 59
LDI r7, 16
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
