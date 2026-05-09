; DESCRIPTION: Renders a purple box of size 82x31 starting at (355, 176).
; PLAN: r0=355(x), r1=176(y), r2=82(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 176
LDI r2, 82
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
