; DESCRIPTION: Renders a white box of size 17x16 starting at (184, 9).
; PLAN: r0=184(x), r1=9(y), r2=17(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 9
LDI r2, 17
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
