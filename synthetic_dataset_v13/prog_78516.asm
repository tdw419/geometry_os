; DESCRIPTION: Renders a purple box of size 112x116 starting at (35, 109).
; PLAN: r0=35(x), r1=109(y), r2=112(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 109
LDI r2, 112
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
