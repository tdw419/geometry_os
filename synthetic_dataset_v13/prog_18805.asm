; DESCRIPTION: Renders a green box of size 33x41 starting at (0, 46).
; PLAN: r0=0(x), r1=46(y), r2=33(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 46
LDI r2, 33
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
