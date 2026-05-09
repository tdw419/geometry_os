; DESCRIPTION: Renders a purple box of size 40x27 starting at (328, 141).
; PLAN: r0=328(x), r1=141(y), r2=40(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 141
LDI r2, 40
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
