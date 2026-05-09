; DESCRIPTION: Renders a purple box of size 116x52 starting at (35, 186).
; PLAN: r0=35(x), r1=186(y), r2=116(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 186
LDI r2, 116
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
