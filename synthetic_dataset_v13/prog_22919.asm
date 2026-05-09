; DESCRIPTION: Renders a magenta box of size 72x12 starting at (233, 126).
; PLAN: r0=233(x), r1=126(y), r2=72(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 126
LDI r2, 72
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
