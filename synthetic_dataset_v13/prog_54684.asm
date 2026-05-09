; DESCRIPTION: Draws a yellow rectangle at (189, 223) with width 41 and height 33.
; PLAN: r0=189(x), r1=223(y), r2=41(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 223
LDI r2, 41
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
