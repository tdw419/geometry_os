; DESCRIPTION: Renders a black box of size 39x115 starting at (46, 105).
; PLAN: r0=46(x), r1=105(y), r2=39(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 105
LDI r2, 39
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
