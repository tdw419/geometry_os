; DESCRIPTION: Renders a magenta box of size 105x76 starting at (395, 79).
; PLAN: r0=395(x), r1=79(y), r2=105(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 79
LDI r2, 105
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
