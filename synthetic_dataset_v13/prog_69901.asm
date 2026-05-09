; DESCRIPTION: Renders a white box of size 112x79 starting at (120, 10).
; PLAN: r0=120(x), r1=10(y), r2=112(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 10
LDI r2, 112
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
