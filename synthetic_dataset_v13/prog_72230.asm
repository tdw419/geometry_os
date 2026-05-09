; DESCRIPTION: Renders a blue box of size 111x49 starting at (384, 140).
; PLAN: r0=384(x), r1=140(y), r2=111(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 140
LDI r2, 111
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
