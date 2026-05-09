; DESCRIPTION: Renders a black box of size 111x100 starting at (317, 26).
; PLAN: r0=317(x), r1=26(y), r2=111(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 26
LDI r2, 111
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
