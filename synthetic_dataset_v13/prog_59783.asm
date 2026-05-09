; DESCRIPTION: Renders a magenta box of size 84x10 starting at (354, 59).
; PLAN: r0=354(x), r1=59(y), r2=84(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 59
LDI r2, 84
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
