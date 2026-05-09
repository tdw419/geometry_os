; DESCRIPTION: Places a magenta 40x85 rectangle at position (167, 136).
; PLAN: r0=167(x), r1=136(y), r2=40(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 136
LDI r2, 40
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
