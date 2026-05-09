; DESCRIPTION: Renders a white box of size 44x101 starting at (447, 121).
; PLAN: r0=447(x), r1=121(y), r2=44(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 121
LDI r2, 44
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
