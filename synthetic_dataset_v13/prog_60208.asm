; DESCRIPTION: Renders a purple box of size 38x81 starting at (332, 134).
; PLAN: r0=332(x), r1=134(y), r2=38(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 134
LDI r2, 38
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
