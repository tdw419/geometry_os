; DESCRIPTION: Renders a purple box of size 98x66 starting at (244, 67).
; PLAN: r0=244(x), r1=67(y), r2=98(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 67
LDI r2, 98
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
