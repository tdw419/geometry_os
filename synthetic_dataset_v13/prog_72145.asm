; DESCRIPTION: Places a magenta 102x98 rectangle at position (6, 149).
; PLAN: r0=6(x), r1=149(y), r2=102(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 149
LDI r2, 102
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
