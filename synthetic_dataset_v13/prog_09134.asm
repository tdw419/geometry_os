; DESCRIPTION: Renders a magenta box of size 24x21 starting at (209, 224).
; PLAN: r0=209(x), r1=224(y), r2=24(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 224
LDI r2, 24
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
