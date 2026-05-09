; DESCRIPTION: Places a magenta 34x62 rectangle at position (247, 120).
; PLAN: r0=247(x), r1=120(y), r2=34(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 120
LDI r2, 34
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
