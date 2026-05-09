; DESCRIPTION: Renders a white box of size 91x10 starting at (107, 140).
; PLAN: r0=107(x), r1=140(y), r2=91(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 140
LDI r2, 91
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
