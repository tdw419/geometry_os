; DESCRIPTION: Renders a black box of size 73x33 starting at (220, 18).
; PLAN: r0=220(x), r1=18(y), r2=73(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 18
LDI r2, 73
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
