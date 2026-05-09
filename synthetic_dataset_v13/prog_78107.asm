; DESCRIPTION: Renders a white box of size 91x36 starting at (76, 27).
; PLAN: r0=76(x), r1=27(y), r2=91(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 27
LDI r2, 91
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
