; DESCRIPTION: Renders a white box of size 80x15 starting at (283, 1).
; PLAN: r0=283(x), r1=1(y), r2=80(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 1
LDI r2, 80
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
