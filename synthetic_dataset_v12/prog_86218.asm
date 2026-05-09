; DESCRIPTION: Renders a white box of size 68x20 starting at (268, 75).
; PLAN: r0=268(x), r1=75(y), r2=68(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 75
LDI r2, 68
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
