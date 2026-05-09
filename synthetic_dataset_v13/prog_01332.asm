; DESCRIPTION: Renders a purple box of size 36x21 starting at (216, 61).
; PLAN: r0=216(x), r1=61(y), r2=36(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 61
LDI r2, 36
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
