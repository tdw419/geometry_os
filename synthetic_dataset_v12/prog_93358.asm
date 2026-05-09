; DESCRIPTION: Renders a purple box of size 112x114 starting at (320, 94).
; PLAN: r0=320(x), r1=94(y), r2=112(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 94
LDI r2, 112
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
