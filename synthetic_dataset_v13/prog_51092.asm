; DESCRIPTION: Composite: Draws a orange rectangle at (55, 120) with width 104 and height 116 then Renders a orange disk with center (193, 131) and radius 67.
; PLAN: r0=55(x), r1=120(y), r2=104(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=131(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 55
LDI r1, 120
LDI r2, 104
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 131
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
