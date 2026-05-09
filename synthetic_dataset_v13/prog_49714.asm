; DESCRIPTION: Renders a white box of size 29x33 starting at (276, 39).
; PLAN: r0=276(x), r1=39(y), r2=29(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 39
LDI r2, 29
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
