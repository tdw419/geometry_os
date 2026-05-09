; DESCRIPTION: Renders a purple box of size 28x35 starting at (325, 200).
; PLAN: r0=325(x), r1=200(y), r2=28(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 200
LDI r2, 28
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
