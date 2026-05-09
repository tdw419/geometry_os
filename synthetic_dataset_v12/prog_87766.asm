; DESCRIPTION: Renders a purple box of size 113x76 starting at (279, 76).
; PLAN: r0=279(x), r1=76(y), r2=113(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 76
LDI r2, 113
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
