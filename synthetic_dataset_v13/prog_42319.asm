; DESCRIPTION: Renders a magenta box of size 74x46 starting at (200, 210).
; PLAN: r0=200(x), r1=210(y), r2=74(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 210
LDI r2, 74
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
