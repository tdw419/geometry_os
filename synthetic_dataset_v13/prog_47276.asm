; DESCRIPTION: Renders a purple box of size 45x53 starting at (290, 72).
; PLAN: r0=290(x), r1=72(y), r2=45(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 72
LDI r2, 45
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
