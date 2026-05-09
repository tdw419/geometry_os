; DESCRIPTION: Renders a magenta box of size 10x64 starting at (299, 142).
; PLAN: r0=299(x), r1=142(y), r2=10(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 142
LDI r2, 10
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
