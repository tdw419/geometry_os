; DESCRIPTION: Renders a white box of size 104x22 starting at (131, 232).
; PLAN: r0=131(x), r1=232(y), r2=104(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 232
LDI r2, 104
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
