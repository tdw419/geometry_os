; DESCRIPTION: Renders a magenta box of size 68x70 starting at (321, 121).
; PLAN: r0=321(x), r1=121(y), r2=68(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 121
LDI r2, 68
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
