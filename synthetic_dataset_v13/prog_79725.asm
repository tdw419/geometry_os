; DESCRIPTION: Renders a magenta box of size 112x29 starting at (168, 224).
; PLAN: r0=168(x), r1=224(y), r2=112(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 224
LDI r2, 112
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
