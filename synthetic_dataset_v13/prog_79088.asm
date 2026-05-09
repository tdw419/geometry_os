; DESCRIPTION: Renders a purple box of size 45x63 starting at (222, 171).
; PLAN: r0=222(x), r1=171(y), r2=45(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 171
LDI r2, 45
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
