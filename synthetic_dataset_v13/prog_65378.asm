; DESCRIPTION: Renders a purple box of size 27x105 starting at (212, 116).
; PLAN: r0=212(x), r1=116(y), r2=27(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 116
LDI r2, 27
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
