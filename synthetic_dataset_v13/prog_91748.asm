; DESCRIPTION: Renders a white box of size 105x21 starting at (125, 91).
; PLAN: r0=125(x), r1=91(y), r2=105(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 91
LDI r2, 105
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
