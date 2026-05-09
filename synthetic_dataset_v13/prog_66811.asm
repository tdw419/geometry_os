; DESCRIPTION: Renders a purple box of size 79x25 starting at (239, 194).
; PLAN: r0=239(x), r1=194(y), r2=79(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 194
LDI r2, 79
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
