; DESCRIPTION: Renders a purple box of size 90x29 starting at (372, 119).
; PLAN: r0=372(x), r1=119(y), r2=90(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 119
LDI r2, 90
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
