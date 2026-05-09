; DESCRIPTION: Renders a purple box of size 78x77 starting at (57, 60).
; PLAN: r0=57(x), r1=60(y), r2=78(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 60
LDI r2, 78
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
