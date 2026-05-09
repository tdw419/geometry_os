; DESCRIPTION: Renders a black box of size 81x111 starting at (210, 93).
; PLAN: r0=210(x), r1=93(y), r2=81(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 93
LDI r2, 81
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
