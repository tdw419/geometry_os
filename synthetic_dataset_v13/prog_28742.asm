; DESCRIPTION: Renders a purple box of size 21x73 starting at (388, 8).
; PLAN: r0=388(x), r1=8(y), r2=21(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 8
LDI r2, 21
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
