; DESCRIPTION: Renders a yellow box of size 107x40 starting at (187, 53).
; PLAN: r0=187(x), r1=53(y), r2=107(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 53
LDI r2, 107
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
