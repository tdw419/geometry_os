; DESCRIPTION: Places a magenta 62x102 rectangle at position (177, 44).
; PLAN: r0=177(x), r1=44(y), r2=62(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 44
LDI r2, 62
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
