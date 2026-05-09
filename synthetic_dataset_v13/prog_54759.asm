; DESCRIPTION: Renders a purple box of size 106x13 starting at (143, 243).
; PLAN: r0=143(x), r1=243(y), r2=106(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 243
LDI r2, 106
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
