; DESCRIPTION: Renders a magenta box of size 101x50 starting at (254, 131).
; PLAN: r0=254(x), r1=131(y), r2=101(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 131
LDI r2, 101
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
