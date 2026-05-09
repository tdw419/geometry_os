; DESCRIPTION: Composite: Creates a blue rectangular region at (399, 27) spanning 59 by 30 pixels then Renders a blue disk with center (408, 196) and radius 59.
; PLAN: r0=399(x), r1=27(y), r2=59(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=196(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 27
LDI r2, 59
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 196
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
