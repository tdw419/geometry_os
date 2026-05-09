; DESCRIPTION: Renders a black box of size 90x20 starting at (274, 202).
; PLAN: r0=274(x), r1=202(y), r2=90(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 202
LDI r2, 90
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
