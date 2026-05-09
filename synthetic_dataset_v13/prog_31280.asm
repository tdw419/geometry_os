; DESCRIPTION: Renders a purple box of size 63x115 starting at (104, 5).
; PLAN: r0=104(x), r1=5(y), r2=63(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 5
LDI r2, 63
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
