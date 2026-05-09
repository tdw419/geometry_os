; DESCRIPTION: Renders a black box of size 100x91 starting at (333, 47).
; PLAN: r0=333(x), r1=47(y), r2=100(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 47
LDI r2, 100
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
