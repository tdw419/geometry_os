; DESCRIPTION: Renders a purple box of size 94x25 starting at (405, 64).
; PLAN: r0=405(x), r1=64(y), r2=94(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 64
LDI r2, 94
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
