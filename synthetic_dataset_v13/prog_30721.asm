; DESCRIPTION: Creates a magenta rectangular region at (162, 31) spanning 87 by 36 pixels.
; PLAN: r0=162(x), r1=31(y), r2=87(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 31
LDI r2, 87
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
