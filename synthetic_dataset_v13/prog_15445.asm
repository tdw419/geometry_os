; DESCRIPTION: Renders a purple box of size 28x90 starting at (251, 43).
; PLAN: r0=251(x), r1=43(y), r2=28(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 43
LDI r2, 28
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
