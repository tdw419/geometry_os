; DESCRIPTION: Renders a blue box of size 91x97 starting at (25, 125).
; PLAN: r0=25(x), r1=125(y), r2=91(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 125
LDI r2, 91
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
