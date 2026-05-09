; DESCRIPTION: Renders a green box of size 97x105 starting at (90, 142).
; PLAN: r0=90(x), r1=142(y), r2=97(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 142
LDI r2, 97
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
