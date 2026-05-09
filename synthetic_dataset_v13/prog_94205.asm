; DESCRIPTION: Renders a magenta box of size 30x33 starting at (254, 141).
; PLAN: r0=254(x), r1=141(y), r2=30(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 141
LDI r2, 30
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
