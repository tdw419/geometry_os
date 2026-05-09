; DESCRIPTION: Renders a white box of size 74x12 starting at (75, 82).
; PLAN: r0=75(x), r1=82(y), r2=74(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 82
LDI r2, 74
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
