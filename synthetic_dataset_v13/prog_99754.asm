; DESCRIPTION: Renders a blue box of size 115x48 starting at (296, 139).
; PLAN: r0=296(x), r1=139(y), r2=115(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 139
LDI r2, 115
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
