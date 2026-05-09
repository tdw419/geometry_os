; DESCRIPTION: Renders a blue box of size 74x27 starting at (237, 14).
; PLAN: r0=237(x), r1=14(y), r2=74(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 14
LDI r2, 74
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
