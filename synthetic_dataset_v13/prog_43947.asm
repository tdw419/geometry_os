; DESCRIPTION: Renders a red box of size 97x105 starting at (159, 142).
; PLAN: r0=159(x), r1=142(y), r2=97(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 142
LDI r2, 97
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
