; DESCRIPTION: Renders a white box of size 33x13 starting at (298, 179).
; PLAN: r0=298(x), r1=179(y), r2=33(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 179
LDI r2, 33
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
