; DESCRIPTION: Renders a magenta box of size 24x48 starting at (62, 178).
; PLAN: r0=62(x), r1=178(y), r2=24(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 178
LDI r2, 24
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
