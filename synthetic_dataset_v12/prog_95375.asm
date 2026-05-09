; DESCRIPTION: Renders a purple box of size 74x32 starting at (419, 210).
; PLAN: r0=419(x), r1=210(y), r2=74(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 210
LDI r2, 74
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
