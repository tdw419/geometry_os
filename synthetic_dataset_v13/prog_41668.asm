; DESCRIPTION: Renders a white box of size 84x52 starting at (187, 176).
; PLAN: r0=187(x), r1=176(y), r2=84(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 176
LDI r2, 84
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
