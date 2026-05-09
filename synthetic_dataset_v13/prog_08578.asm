; DESCRIPTION: Renders a black box of size 94x111 starting at (26, 60).
; PLAN: r0=26(x), r1=60(y), r2=94(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 60
LDI r2, 94
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
