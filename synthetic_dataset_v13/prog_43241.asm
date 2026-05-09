; DESCRIPTION: Renders a green box of size 36x38 starting at (268, 129).
; PLAN: r0=268(x), r1=129(y), r2=36(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 129
LDI r2, 36
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
