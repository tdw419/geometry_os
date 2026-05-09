; DESCRIPTION: Renders a black box of size 13x98 starting at (92, 157).
; PLAN: r0=92(x), r1=157(y), r2=13(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 157
LDI r2, 13
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
