; DESCRIPTION: Renders a magenta box of size 81x18 starting at (401, 123).
; PLAN: r0=401(x), r1=123(y), r2=81(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 123
LDI r2, 81
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
