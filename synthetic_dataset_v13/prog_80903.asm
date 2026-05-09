; DESCRIPTION: Renders a purple box of size 81x109 starting at (405, 80).
; PLAN: r0=405(x), r1=80(y), r2=81(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 80
LDI r2, 81
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
