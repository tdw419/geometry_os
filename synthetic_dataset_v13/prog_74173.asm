; DESCRIPTION: Renders a purple box of size 45x116 starting at (297, 17).
; PLAN: r0=297(x), r1=17(y), r2=45(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 17
LDI r2, 45
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
