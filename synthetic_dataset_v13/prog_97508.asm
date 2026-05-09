; DESCRIPTION: Renders a magenta box of size 42x81 starting at (100, 55).
; PLAN: r0=100(x), r1=55(y), r2=42(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 55
LDI r2, 42
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
