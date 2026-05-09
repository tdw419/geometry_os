; DESCRIPTION: Renders a purple box of size 60x71 starting at (367, 20).
; PLAN: r0=367(x), r1=20(y), r2=60(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 20
LDI r2, 60
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
