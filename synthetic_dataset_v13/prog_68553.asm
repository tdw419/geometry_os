; DESCRIPTION: Renders a purple box of size 84x120 starting at (2, 13).
; PLAN: r0=2(x), r1=13(y), r2=84(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 13
LDI r2, 84
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
