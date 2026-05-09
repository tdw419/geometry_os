; DESCRIPTION: Renders a purple box of size 17x27 starting at (274, 179).
; PLAN: r0=274(x), r1=179(y), r2=17(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 179
LDI r2, 17
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
