; DESCRIPTION: Renders a white box of size 33x17 starting at (380, 105).
; PLAN: r0=380(x), r1=105(y), r2=33(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 105
LDI r2, 33
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
