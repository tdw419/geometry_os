; DESCRIPTION: Places a magenta 116x98 rectangle at position (393, 136).
; PLAN: r0=393(x), r1=136(y), r2=116(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 136
LDI r2, 116
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
