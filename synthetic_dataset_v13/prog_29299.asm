; DESCRIPTION: Renders a magenta box of size 92x32 starting at (58, 64).
; PLAN: r0=58(x), r1=64(y), r2=92(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 64
LDI r2, 92
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
