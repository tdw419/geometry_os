; DESCRIPTION: Renders a magenta box of size 104x97 starting at (299, 53).
; PLAN: r0=299(x), r1=53(y), r2=104(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 53
LDI r2, 104
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
