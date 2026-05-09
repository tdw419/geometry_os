; DESCRIPTION: Renders a magenta box of size 35x45 starting at (133, 35).
; PLAN: r0=133(x), r1=35(y), r2=35(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 35
LDI r2, 35
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
