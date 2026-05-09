; DESCRIPTION: Renders a magenta box of size 56x113 starting at (59, 3).
; PLAN: r0=59(x), r1=3(y), r2=56(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 3
LDI r2, 56
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
