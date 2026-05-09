; DESCRIPTION: Renders a magenta box of size 84x72 starting at (28, 131).
; PLAN: r0=28(x), r1=131(y), r2=84(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 131
LDI r2, 84
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
