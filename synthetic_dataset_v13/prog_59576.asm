; DESCRIPTION: Renders a magenta box of size 87x55 starting at (112, 161).
; PLAN: r0=112(x), r1=161(y), r2=87(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 161
LDI r2, 87
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
