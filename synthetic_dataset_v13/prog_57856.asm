; DESCRIPTION: Renders a black box of size 105x22 starting at (380, 16).
; PLAN: r0=380(x), r1=16(y), r2=105(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 16
LDI r2, 105
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
