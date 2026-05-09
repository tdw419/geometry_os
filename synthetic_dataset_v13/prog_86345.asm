; DESCRIPTION: Renders a magenta box of size 32x35 starting at (333, 32).
; PLAN: r0=333(x), r1=32(y), r2=32(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 32
LDI r2, 32
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
