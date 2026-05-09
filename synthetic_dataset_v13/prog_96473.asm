; DESCRIPTION: Renders a magenta box of size 117x19 starting at (325, 38).
; PLAN: r0=325(x), r1=38(y), r2=117(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 38
LDI r2, 117
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
