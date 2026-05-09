; DESCRIPTION: Renders a green box of size 41x70 starting at (76, 17).
; PLAN: r0=76(x), r1=17(y), r2=41(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 17
LDI r2, 41
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
