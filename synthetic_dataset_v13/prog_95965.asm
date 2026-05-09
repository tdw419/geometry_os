; DESCRIPTION: Renders a magenta box of size 77x60 starting at (110, 160).
; PLAN: r0=110(x), r1=160(y), r2=77(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 160
LDI r2, 77
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
