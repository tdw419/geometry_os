; DESCRIPTION: Renders a purple box of size 116x36 starting at (276, 199).
; PLAN: r0=276(x), r1=199(y), r2=116(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 199
LDI r2, 116
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
