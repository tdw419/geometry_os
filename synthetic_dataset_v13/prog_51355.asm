; DESCRIPTION: Renders a white box of size 78x39 starting at (192, 204).
; PLAN: r0=192(x), r1=204(y), r2=78(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 204
LDI r2, 78
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
