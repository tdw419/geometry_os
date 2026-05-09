; DESCRIPTION: Renders a black box of size 91x81 starting at (317, 108).
; PLAN: r0=317(x), r1=108(y), r2=91(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 108
LDI r2, 91
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
