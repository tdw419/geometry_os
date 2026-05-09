; DESCRIPTION: Renders a purple box of size 116x35 starting at (275, 52).
; PLAN: r0=275(x), r1=52(y), r2=116(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 52
LDI r2, 116
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
