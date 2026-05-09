; DESCRIPTION: Renders a purple box of size 103x89 starting at (217, 30).
; PLAN: r0=217(x), r1=30(y), r2=103(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 30
LDI r2, 103
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
