; DESCRIPTION: Renders a black box of size 47x73 starting at (303, 76).
; PLAN: r0=303(x), r1=76(y), r2=47(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 76
LDI r2, 47
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
