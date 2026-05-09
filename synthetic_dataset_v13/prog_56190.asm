; DESCRIPTION: Renders a purple box of size 106x30 starting at (107, 178).
; PLAN: r0=107(x), r1=178(y), r2=106(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 178
LDI r2, 106
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
