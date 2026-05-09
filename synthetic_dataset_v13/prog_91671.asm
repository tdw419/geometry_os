; DESCRIPTION: Renders a magenta box of size 62x32 starting at (450, 93).
; PLAN: r0=450(x), r1=93(y), r2=62(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 93
LDI r2, 62
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
