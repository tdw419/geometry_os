; DESCRIPTION: Renders a magenta box of size 60x102 starting at (288, 70).
; PLAN: r0=288(x), r1=70(y), r2=60(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 70
LDI r2, 60
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
