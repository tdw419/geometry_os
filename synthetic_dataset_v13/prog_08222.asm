; DESCRIPTION: Renders a white box of size 94x74 starting at (287, 26).
; PLAN: r0=287(x), r1=26(y), r2=94(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 26
LDI r2, 94
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
