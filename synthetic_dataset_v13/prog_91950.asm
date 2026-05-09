; DESCRIPTION: Renders a magenta box of size 102x116 starting at (42, 64).
; PLAN: r0=42(x), r1=64(y), r2=102(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 64
LDI r2, 102
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
