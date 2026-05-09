; DESCRIPTION: Renders a magenta box of size 59x30 starting at (245, 153).
; PLAN: r0=245(x), r1=153(y), r2=59(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 153
LDI r2, 59
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
