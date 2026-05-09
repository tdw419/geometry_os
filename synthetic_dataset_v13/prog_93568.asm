; DESCRIPTION: Renders a white box of size 65x109 starting at (420, 97).
; PLAN: r0=420(x), r1=97(y), r2=65(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 97
LDI r2, 65
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
