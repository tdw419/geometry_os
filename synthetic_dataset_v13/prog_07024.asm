; DESCRIPTION: Renders a magenta box of size 96x106 starting at (400, 45).
; PLAN: r0=400(x), r1=45(y), r2=96(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 45
LDI r2, 96
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
