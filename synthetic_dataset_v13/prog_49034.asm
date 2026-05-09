; DESCRIPTION: Renders a black box of size 107x75 starting at (202, 58).
; PLAN: r0=202(x), r1=58(y), r2=107(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 58
LDI r2, 107
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
