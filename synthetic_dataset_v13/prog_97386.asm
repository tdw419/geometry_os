; DESCRIPTION: Renders a purple box of size 60x104 starting at (413, 70).
; PLAN: r0=413(x), r1=70(y), r2=60(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 70
LDI r2, 60
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
