; DESCRIPTION: Renders a purple box of size 15x53 starting at (419, 133).
; PLAN: r0=419(x), r1=133(y), r2=15(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 133
LDI r2, 15
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
