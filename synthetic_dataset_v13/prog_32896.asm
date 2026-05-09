; DESCRIPTION: Renders a magenta box of size 19x104 starting at (336, 73).
; PLAN: r0=336(x), r1=73(y), r2=19(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 73
LDI r2, 19
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
