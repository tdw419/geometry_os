; DESCRIPTION: Renders a white box of size 94x84 starting at (44, 172).
; PLAN: r0=44(x), r1=172(y), r2=94(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 172
LDI r2, 94
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
