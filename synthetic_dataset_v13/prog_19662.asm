; DESCRIPTION: Renders a magenta box of size 77x22 starting at (31, 161).
; PLAN: r0=31(x), r1=161(y), r2=77(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 161
LDI r2, 77
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
