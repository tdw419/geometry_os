; DESCRIPTION: Renders a white box of size 97x85 starting at (75, 89).
; PLAN: r0=75(x), r1=89(y), r2=97(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 89
LDI r2, 97
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
