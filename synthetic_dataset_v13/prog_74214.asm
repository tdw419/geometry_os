; DESCRIPTION: Renders a magenta box of size 110x109 starting at (19, 33).
; PLAN: r0=19(x), r1=33(y), r2=110(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 33
LDI r2, 110
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
