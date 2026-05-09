; DESCRIPTION: Renders a purple box of size 62x11 starting at (329, 208).
; PLAN: r0=329(x), r1=208(y), r2=62(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 208
LDI r2, 62
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
