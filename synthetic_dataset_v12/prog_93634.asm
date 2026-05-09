; DESCRIPTION: Places a magenta 50x118 rectangle at position (415, 122).
; PLAN: r0=415(x), r1=122(y), r2=50(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 122
LDI r2, 50
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
