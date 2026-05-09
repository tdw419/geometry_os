; DESCRIPTION: Renders a purple box of size 95x31 starting at (116, 219).
; PLAN: r0=116(x), r1=219(y), r2=95(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 219
LDI r2, 95
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
