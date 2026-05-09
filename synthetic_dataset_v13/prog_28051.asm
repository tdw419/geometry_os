; DESCRIPTION: Renders a purple box of size 53x34 starting at (365, 20).
; PLAN: r0=365(x), r1=20(y), r2=53(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 20
LDI r2, 53
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
