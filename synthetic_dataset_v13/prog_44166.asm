; DESCRIPTION: Renders a purple box of size 28x11 starting at (293, 161).
; PLAN: r0=293(x), r1=161(y), r2=28(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 161
LDI r2, 28
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
