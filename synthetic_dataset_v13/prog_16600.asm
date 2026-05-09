; DESCRIPTION: Renders a purple box of size 74x63 starting at (239, 70).
; PLAN: r0=239(x), r1=70(y), r2=74(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 70
LDI r2, 74
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
