; DESCRIPTION: Renders a purple box of size 68x27 starting at (336, 4).
; PLAN: r0=336(x), r1=4(y), r2=68(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 4
LDI r2, 68
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
