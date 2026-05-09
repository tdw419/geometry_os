; DESCRIPTION: Places a magenta 71x119 rectangle at position (193, 102).
; PLAN: r0=193(x), r1=102(y), r2=71(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 102
LDI r2, 71
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
