; DESCRIPTION: Renders a blue box of size 116x96 starting at (209, 30).
; PLAN: r0=209(x), r1=30(y), r2=116(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 30
LDI r2, 116
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
