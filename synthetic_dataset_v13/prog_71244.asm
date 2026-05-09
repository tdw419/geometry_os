; DESCRIPTION: Renders a magenta box of size 84x84 starting at (156, 152).
; PLAN: r0=156(x), r1=152(y), r2=84(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 152
LDI r2, 84
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
