; DESCRIPTION: Renders a black box of size 38x111 starting at (412, 34).
; PLAN: r0=412(x), r1=34(y), r2=38(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 34
LDI r2, 38
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
