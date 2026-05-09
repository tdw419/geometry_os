; DESCRIPTION: Renders a white box of size 10x62 starting at (290, 39).
; PLAN: r0=290(x), r1=39(y), r2=10(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 39
LDI r2, 10
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
