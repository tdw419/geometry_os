; DESCRIPTION: Renders a purple box of size 16x104 starting at (291, 112).
; PLAN: r0=291(x), r1=112(y), r2=16(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 112
LDI r2, 16
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
