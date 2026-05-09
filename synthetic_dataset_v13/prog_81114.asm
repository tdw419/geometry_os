; DESCRIPTION: Renders a purple box of size 28x74 starting at (137, 120).
; PLAN: r0=137(x), r1=120(y), r2=28(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 120
LDI r2, 28
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
