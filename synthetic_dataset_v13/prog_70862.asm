; DESCRIPTION: Renders a purple box of size 52x65 starting at (247, 14).
; PLAN: r0=247(x), r1=14(y), r2=52(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 14
LDI r2, 52
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
