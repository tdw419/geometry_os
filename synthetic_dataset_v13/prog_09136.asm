; DESCRIPTION: Renders a purple box of size 66x53 starting at (208, 175).
; PLAN: r0=208(x), r1=175(y), r2=66(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 175
LDI r2, 66
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
