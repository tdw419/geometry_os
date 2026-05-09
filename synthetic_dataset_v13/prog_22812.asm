; DESCRIPTION: Places a blue 88x112 rectangle at position (92, 99).
; PLAN: r0=92(x), r1=99(y), r2=88(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 99
LDI r2, 88
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
