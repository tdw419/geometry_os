; DESCRIPTION: Renders a white box of size 115x104 starting at (266, 40).
; PLAN: r0=266(x), r1=40(y), r2=115(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 40
LDI r2, 115
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
