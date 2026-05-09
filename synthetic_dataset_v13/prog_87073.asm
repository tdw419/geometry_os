; DESCRIPTION: Renders a purple box of size 40x116 starting at (378, 103).
; PLAN: r0=378(x), r1=103(y), r2=40(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 103
LDI r2, 40
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
