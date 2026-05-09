; DESCRIPTION: Places a magenta 106x102 rectangle at position (249, 72).
; PLAN: r0=249(x), r1=72(y), r2=106(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 72
LDI r2, 106
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
