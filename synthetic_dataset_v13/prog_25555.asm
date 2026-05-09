; DESCRIPTION: Places a magenta 119x40 rectangle at position (276, 167).
; PLAN: r0=276(x), r1=167(y), r2=119(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 167
LDI r2, 119
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
