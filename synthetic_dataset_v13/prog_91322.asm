; DESCRIPTION: Renders a purple box of size 25x57 starting at (85, 161).
; PLAN: r0=85(x), r1=161(y), r2=25(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 161
LDI r2, 25
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
