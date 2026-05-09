; DESCRIPTION: Renders a magenta box of size 84x64 starting at (421, 33).
; PLAN: r0=421(x), r1=33(y), r2=84(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 33
LDI r2, 84
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
