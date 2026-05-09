; DESCRIPTION: Renders a purple box of size 21x53 starting at (96, 87).
; PLAN: r0=96(x), r1=87(y), r2=21(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 87
LDI r2, 21
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
