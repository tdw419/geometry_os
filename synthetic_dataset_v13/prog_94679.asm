; DESCRIPTION: Places a magenta 96x22 rectangle at position (34, 234).
; PLAN: r0=34(x), r1=234(y), r2=96(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 234
LDI r2, 96
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
