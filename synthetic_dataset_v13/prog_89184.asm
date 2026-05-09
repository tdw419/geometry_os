; DESCRIPTION: Renders a white box of size 67x33 starting at (424, 147).
; PLAN: r0=424(x), r1=147(y), r2=67(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 147
LDI r2, 67
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
