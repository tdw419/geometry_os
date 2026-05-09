; DESCRIPTION: Renders a magenta box of size 82x101 starting at (418, 128).
; PLAN: r0=418(x), r1=128(y), r2=82(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 128
LDI r2, 82
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
