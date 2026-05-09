; DESCRIPTION: Renders a yellow box of size 74x40 starting at (240, 57).
; PLAN: r0=240(x), r1=57(y), r2=74(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 57
LDI r2, 74
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
