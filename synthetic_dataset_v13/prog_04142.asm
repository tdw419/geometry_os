; DESCRIPTION: Renders a magenta box of size 15x15 starting at (69, 139).
; PLAN: r0=69(x), r1=139(y), r2=15(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 139
LDI r2, 15
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
