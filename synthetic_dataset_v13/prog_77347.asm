; DESCRIPTION: Renders a purple box of size 97x77 starting at (21, 139).
; PLAN: r0=21(x), r1=139(y), r2=97(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 139
LDI r2, 97
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
