; DESCRIPTION: Renders a purple box of size 89x35 starting at (168, 172).
; PLAN: r0=168(x), r1=172(y), r2=89(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 172
LDI r2, 89
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
