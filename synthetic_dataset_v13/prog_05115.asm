; DESCRIPTION: Renders a purple box of size 28x79 starting at (114, 121).
; PLAN: r0=114(x), r1=121(y), r2=28(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 121
LDI r2, 28
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
