; DESCRIPTION: Renders a purple box of size 19x47 starting at (481, 184).
; PLAN: r0=481(x), r1=184(y), r2=19(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 184
LDI r2, 19
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
