; DESCRIPTION: Places a magenta 43x58 rectangle at position (77, 48).
; PLAN: r0=77(x), r1=48(y), r2=43(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 48
LDI r2, 43
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
