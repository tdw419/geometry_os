; DESCRIPTION: Places a magenta 105x91 rectangle at position (189, 136).
; PLAN: r0=189(x), r1=136(y), r2=105(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 136
LDI r2, 105
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
