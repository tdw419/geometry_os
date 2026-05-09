; DESCRIPTION: Renders a magenta box of size 18x21 starting at (418, 53).
; PLAN: r0=418(x), r1=53(y), r2=18(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 53
LDI r2, 18
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
