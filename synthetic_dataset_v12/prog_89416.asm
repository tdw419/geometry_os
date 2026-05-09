; DESCRIPTION: Renders a green box of size 61x58 starting at (278, 116).
; PLAN: r0=278(x), r1=116(y), r2=61(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 116
LDI r2, 61
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
