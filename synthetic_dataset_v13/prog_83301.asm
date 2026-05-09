; DESCRIPTION: Renders a black box of size 106x60 starting at (170, 40).
; PLAN: r0=170(x), r1=40(y), r2=106(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 40
LDI r2, 106
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
