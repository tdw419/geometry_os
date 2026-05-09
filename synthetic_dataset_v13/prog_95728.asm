; DESCRIPTION: Renders a purple box of size 100x23 starting at (115, 186).
; PLAN: r0=115(x), r1=186(y), r2=100(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 186
LDI r2, 100
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
