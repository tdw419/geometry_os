; DESCRIPTION: Renders a purple box of size 62x60 starting at (218, 130).
; PLAN: r0=218(x), r1=130(y), r2=62(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 130
LDI r2, 62
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
