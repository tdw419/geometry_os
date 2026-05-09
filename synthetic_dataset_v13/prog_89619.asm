; DESCRIPTION: Renders a purple box of size 49x33 starting at (173, 80).
; PLAN: r0=173(x), r1=80(y), r2=49(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 80
LDI r2, 49
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
