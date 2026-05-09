; DESCRIPTION: Renders a magenta box of size 17x27 starting at (268, 224).
; PLAN: r0=268(x), r1=224(y), r2=17(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 224
LDI r2, 17
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
