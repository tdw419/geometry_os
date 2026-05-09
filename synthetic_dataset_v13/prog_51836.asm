; DESCRIPTION: Renders a magenta box of size 72x34 starting at (110, 189).
; PLAN: r0=110(x), r1=189(y), r2=72(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 189
LDI r2, 72
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
