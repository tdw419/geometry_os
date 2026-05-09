; DESCRIPTION: Renders a magenta box of size 15x73 starting at (110, 31).
; PLAN: r0=110(x), r1=31(y), r2=15(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 31
LDI r2, 15
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
