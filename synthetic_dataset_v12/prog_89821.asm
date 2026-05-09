; DESCRIPTION: Renders a white box of size 104x12 starting at (43, 110).
; PLAN: r0=43(x), r1=110(y), r2=104(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 110
LDI r2, 104
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
