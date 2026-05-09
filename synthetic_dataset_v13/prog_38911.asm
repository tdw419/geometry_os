; DESCRIPTION: Renders a magenta box of size 49x95 starting at (244, 139).
; PLAN: r0=244(x), r1=139(y), r2=49(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 139
LDI r2, 49
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
