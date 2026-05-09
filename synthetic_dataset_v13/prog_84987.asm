; DESCRIPTION: Renders a white box of size 20x33 starting at (70, 49).
; PLAN: r0=70(x), r1=49(y), r2=20(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 49
LDI r2, 20
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
