; DESCRIPTION: Renders a purple box of size 13x64 starting at (377, 184).
; PLAN: r0=377(x), r1=184(y), r2=13(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 184
LDI r2, 13
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
