; DESCRIPTION: Renders a purple box of size 60x59 starting at (363, 5).
; PLAN: r0=363(x), r1=5(y), r2=60(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 5
LDI r2, 60
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
