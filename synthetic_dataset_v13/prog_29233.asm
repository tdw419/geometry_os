; DESCRIPTION: Renders a black box of size 102x91 starting at (353, 7).
; PLAN: r0=353(x), r1=7(y), r2=102(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 7
LDI r2, 102
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
