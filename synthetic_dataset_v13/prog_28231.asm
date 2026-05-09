; DESCRIPTION: Renders a purple box of size 77x94 starting at (218, 19).
; PLAN: r0=218(x), r1=19(y), r2=77(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 19
LDI r2, 77
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
