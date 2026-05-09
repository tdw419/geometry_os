; DESCRIPTION: Renders a white box of size 110x25 starting at (251, 17).
; PLAN: r0=251(x), r1=17(y), r2=110(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 17
LDI r2, 110
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
