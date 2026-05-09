; DESCRIPTION: Creates a magenta rectangular region at (101, 23) spanning 48 by 120 pixels.
; PLAN: r0=101(x), r1=23(y), r2=48(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 23
LDI r2, 48
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
