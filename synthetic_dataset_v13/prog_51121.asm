; DESCRIPTION: Renders a magenta box of size 38x11 starting at (84, 134).
; PLAN: r0=84(x), r1=134(y), r2=38(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 134
LDI r2, 38
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
