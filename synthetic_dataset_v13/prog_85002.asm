; DESCRIPTION: Creates a magenta rectangular region at (269, 179) spanning 101 by 52 pixels.
; PLAN: r0=269(x), r1=179(y), r2=101(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 179
LDI r2, 101
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
