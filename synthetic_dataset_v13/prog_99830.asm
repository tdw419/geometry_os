; DESCRIPTION: Renders a magenta box of size 32x32 starting at (159, 168).
; PLAN: r0=159(x), r1=168(y), r2=32(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 168
LDI r2, 32
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
