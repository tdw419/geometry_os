; DESCRIPTION: Renders a purple box of size 56x38 starting at (250, 45).
; PLAN: r0=250(x), r1=45(y), r2=56(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 45
LDI r2, 56
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
