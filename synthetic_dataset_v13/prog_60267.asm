; DESCRIPTION: Renders a white box of size 10x22 starting at (17, 104).
; PLAN: r0=17(x), r1=104(y), r2=10(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 104
LDI r2, 10
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
