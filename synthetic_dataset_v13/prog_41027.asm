; DESCRIPTION: Renders a magenta box of size 51x19 starting at (283, 219).
; PLAN: r0=283(x), r1=219(y), r2=51(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 219
LDI r2, 51
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
