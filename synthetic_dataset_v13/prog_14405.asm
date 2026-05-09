; DESCRIPTION: Renders a white box of size 104x73 starting at (185, 49).
; PLAN: r0=185(x), r1=49(y), r2=104(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 49
LDI r2, 104
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
