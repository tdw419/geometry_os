; DESCRIPTION: Renders a magenta box of size 112x21 starting at (354, 194).
; PLAN: r0=354(x), r1=194(y), r2=112(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 194
LDI r2, 112
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
