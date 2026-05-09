; DESCRIPTION: Renders a purple box of size 32x120 starting at (104, 30).
; PLAN: r0=104(x), r1=30(y), r2=32(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 30
LDI r2, 32
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
