; DESCRIPTION: Renders a magenta box of size 28x69 starting at (294, 102).
; PLAN: r0=294(x), r1=102(y), r2=28(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 102
LDI r2, 28
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
