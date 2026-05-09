; DESCRIPTION: Renders a purple box of size 120x87 starting at (159, 148).
; PLAN: r0=159(x), r1=148(y), r2=120(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 148
LDI r2, 120
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
