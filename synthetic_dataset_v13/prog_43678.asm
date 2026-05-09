; DESCRIPTION: Renders a purple box of size 68x53 starting at (61, 80).
; PLAN: r0=61(x), r1=80(y), r2=68(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 80
LDI r2, 68
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
