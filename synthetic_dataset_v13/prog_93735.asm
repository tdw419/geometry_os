; DESCRIPTION: Places a magenta 12x115 rectangle at position (134, 0).
; PLAN: r0=134(x), r1=0(y), r2=12(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 0
LDI r2, 12
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
