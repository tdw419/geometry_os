; DESCRIPTION: Renders a magenta box of size 37x72 starting at (165, 64).
; PLAN: r0=165(x), r1=64(y), r2=37(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 64
LDI r2, 37
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
