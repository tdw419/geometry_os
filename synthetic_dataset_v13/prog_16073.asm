; DESCRIPTION: Renders a purple box of size 119x29 starting at (164, 208).
; PLAN: r0=164(x), r1=208(y), r2=119(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 208
LDI r2, 119
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
