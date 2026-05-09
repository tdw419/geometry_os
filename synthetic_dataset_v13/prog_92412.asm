; DESCRIPTION: Renders a black box of size 118x34 starting at (187, 55).
; PLAN: r0=187(x), r1=55(y), r2=118(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 55
LDI r2, 118
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
