; DESCRIPTION: Renders a purple box of size 21x18 starting at (125, 175).
; PLAN: r0=125(x), r1=175(y), r2=21(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 175
LDI r2, 21
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
