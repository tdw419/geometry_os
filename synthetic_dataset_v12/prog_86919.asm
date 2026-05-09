; DESCRIPTION: Renders a black box of size 111x110 starting at (103, 59).
; PLAN: r0=103(x), r1=59(y), r2=111(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 59
LDI r2, 111
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
