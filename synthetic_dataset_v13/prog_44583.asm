; DESCRIPTION: Renders a yellow box of size 20x120 starting at (476, 116).
; PLAN: r0=476(x), r1=116(y), r2=20(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 116
LDI r2, 20
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
