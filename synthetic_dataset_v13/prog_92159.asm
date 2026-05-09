; DESCRIPTION: Renders a black box of size 102x111 starting at (315, 4).
; PLAN: r0=315(x), r1=4(y), r2=102(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 4
LDI r2, 102
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
