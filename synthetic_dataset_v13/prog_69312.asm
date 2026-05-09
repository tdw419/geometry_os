; DESCRIPTION: Renders a magenta box of size 53x59 starting at (280, 24).
; PLAN: r0=280(x), r1=24(y), r2=53(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 24
LDI r2, 53
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
