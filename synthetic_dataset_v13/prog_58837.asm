; DESCRIPTION: Renders a white box of size 79x48 starting at (345, 75).
; PLAN: r0=345(x), r1=75(y), r2=79(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 75
LDI r2, 79
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
