; DESCRIPTION: Places a magenta 24x102 rectangle at position (99, 149).
; PLAN: r0=99(x), r1=149(y), r2=24(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 149
LDI r2, 24
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
