; DESCRIPTION: Renders a purple box of size 113x19 starting at (334, 209).
; PLAN: r0=334(x), r1=209(y), r2=113(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 209
LDI r2, 113
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
