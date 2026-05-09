; DESCRIPTION: Renders a blue box of size 45x31 starting at (193, 134).
; PLAN: r0=193(x), r1=134(y), r2=45(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 134
LDI r2, 45
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
