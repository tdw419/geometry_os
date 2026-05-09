; DESCRIPTION: Composite: Places a yellow 92x60 rectangle at position (105, 7) then Renders a orange disk with center (89, 174) and radius 69.
; PLAN: r0=105(x), r1=7(y), r2=92(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=174(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 7
LDI r2, 92
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 174
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
