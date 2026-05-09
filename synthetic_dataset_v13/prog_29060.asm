; DESCRIPTION: Draws a black rectangle at (46, 223) with width 43 and height 33.
; PLAN: r0=46(x), r1=223(y), r2=43(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 223
LDI r2, 43
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
