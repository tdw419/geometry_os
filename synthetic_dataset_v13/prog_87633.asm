; DESCRIPTION: Places a magenta 24x105 rectangle at position (88, 48).
; PLAN: r0=88(x), r1=48(y), r2=24(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 48
LDI r2, 24
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
