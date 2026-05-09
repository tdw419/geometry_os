; DESCRIPTION: Renders a white box of size 95x107 starting at (176, 132).
; PLAN: r0=176(x), r1=132(y), r2=95(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 132
LDI r2, 95
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
