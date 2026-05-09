; DESCRIPTION: Places a green 43x92 rectangle at position (414, 136).
; PLAN: r0=414(x), r1=136(y), r2=43(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 136
LDI r2, 43
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
