; DESCRIPTION: Renders a white box of size 36x78 starting at (129, 46).
; PLAN: r0=129(x), r1=46(y), r2=36(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 46
LDI r2, 36
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
