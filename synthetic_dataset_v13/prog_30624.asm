; DESCRIPTION: Places a blue 102x85 rectangle at position (238, 58).
; PLAN: r0=238(x), r1=58(y), r2=102(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 58
LDI r2, 102
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
