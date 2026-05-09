; DESCRIPTION: Renders a white box of size 68x26 starting at (144, 4).
; PLAN: r0=144(x), r1=4(y), r2=68(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 4
LDI r2, 68
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
