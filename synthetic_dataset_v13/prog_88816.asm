; DESCRIPTION: Renders a black box of size 25x29 starting at (59, 93).
; PLAN: r0=59(x), r1=93(y), r2=25(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 93
LDI r2, 25
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
