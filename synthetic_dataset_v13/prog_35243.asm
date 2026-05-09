; DESCRIPTION: Renders a white box of size 71x13 starting at (212, 200).
; PLAN: r0=212(x), r1=200(y), r2=71(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 200
LDI r2, 71
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
