; DESCRIPTION: Renders a white box of size 40x44 starting at (329, 66).
; PLAN: r0=329(x), r1=66(y), r2=40(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 66
LDI r2, 40
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
