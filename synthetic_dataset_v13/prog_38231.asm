; DESCRIPTION: Renders a purple box of size 15x57 starting at (352, 73).
; PLAN: r0=352(x), r1=73(y), r2=15(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 73
LDI r2, 15
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
