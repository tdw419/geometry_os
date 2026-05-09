; DESCRIPTION: Renders a purple box of size 107x95 starting at (3, 38).
; PLAN: r0=3(x), r1=38(y), r2=107(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 38
LDI r2, 107
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
