; DESCRIPTION: Composite: Places a purple 72x100 rectangle at position (340, 67) then Renders a orange disk with center (120, 170) and radius 51.
; PLAN: r0=340(x), r1=67(y), r2=72(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=170(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 67
LDI r2, 72
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 170
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
