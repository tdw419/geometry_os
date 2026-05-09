; DESCRIPTION: Renders a magenta box of size 33x41 starting at (326, 139).
; PLAN: r0=326(x), r1=139(y), r2=33(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 139
LDI r2, 33
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
