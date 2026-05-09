; DESCRIPTION: Renders a purple box of size 31x57 starting at (180, 75).
; PLAN: r0=180(x), r1=75(y), r2=31(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 75
LDI r2, 31
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
