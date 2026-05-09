; DESCRIPTION: Renders a purple box of size 107x34 starting at (76, 171).
; PLAN: r0=76(x), r1=171(y), r2=107(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 171
LDI r2, 107
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
