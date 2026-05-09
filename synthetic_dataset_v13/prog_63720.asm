; DESCRIPTION: Renders a purple box of size 94x95 starting at (29, 90).
; PLAN: r0=29(x), r1=90(y), r2=94(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 90
LDI r2, 94
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
