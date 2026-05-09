; DESCRIPTION: Renders a purple box of size 106x10 starting at (217, 29).
; PLAN: r0=217(x), r1=29(y), r2=106(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 29
LDI r2, 106
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
