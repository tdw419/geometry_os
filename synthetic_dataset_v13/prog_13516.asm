; DESCRIPTION: Renders a white box of size 120x100 starting at (110, 66).
; PLAN: r0=110(x), r1=66(y), r2=120(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 66
LDI r2, 120
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
