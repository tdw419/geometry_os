; DESCRIPTION: Renders a white box of size 18x49 starting at (283, 193).
; PLAN: r0=283(x), r1=193(y), r2=18(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 193
LDI r2, 18
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
