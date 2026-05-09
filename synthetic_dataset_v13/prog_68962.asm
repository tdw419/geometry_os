; DESCRIPTION: Renders a white box of size 74x20 starting at (273, 68).
; PLAN: r0=273(x), r1=68(y), r2=74(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 68
LDI r2, 74
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
