; DESCRIPTION: Renders a white box of size 95x97 starting at (293, 144).
; PLAN: r0=293(x), r1=144(y), r2=95(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 144
LDI r2, 95
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
