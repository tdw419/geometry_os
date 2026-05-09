; DESCRIPTION: Renders a magenta box of size 13x73 starting at (141, 139).
; PLAN: r0=141(x), r1=139(y), r2=13(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 139
LDI r2, 13
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
