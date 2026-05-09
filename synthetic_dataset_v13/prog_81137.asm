; DESCRIPTION: Renders a white box of size 22x105 starting at (34, 98).
; PLAN: r0=34(x), r1=98(y), r2=22(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 98
LDI r2, 22
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
