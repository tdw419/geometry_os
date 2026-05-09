; DESCRIPTION: Renders a purple box of size 53x83 starting at (252, 80).
; PLAN: r0=252(x), r1=80(y), r2=53(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 80
LDI r2, 53
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
