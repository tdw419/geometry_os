; DESCRIPTION: Places a magenta 23x115 rectangle at position (297, 76).
; PLAN: r0=297(x), r1=76(y), r2=23(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 76
LDI r2, 23
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
