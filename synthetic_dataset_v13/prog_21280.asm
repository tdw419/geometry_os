; DESCRIPTION: Renders a white box of size 33x75 starting at (268, 11).
; PLAN: r0=268(x), r1=11(y), r2=33(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 11
LDI r2, 33
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
