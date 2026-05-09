; DESCRIPTION: Renders a black box of size 29x27 starting at (105, 187).
; PLAN: r0=105(x), r1=187(y), r2=29(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 187
LDI r2, 29
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
