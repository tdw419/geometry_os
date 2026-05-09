; DESCRIPTION: Renders a white box of size 105x71 starting at (340, 132).
; PLAN: r0=340(x), r1=132(y), r2=105(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 132
LDI r2, 105
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
