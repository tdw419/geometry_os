; DESCRIPTION: Renders a white box of size 37x33 starting at (84, 39).
; PLAN: r0=84(x), r1=39(y), r2=37(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 39
LDI r2, 37
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
