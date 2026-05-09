; DESCRIPTION: Renders a white box of size 106x79 starting at (2, 165).
; PLAN: r0=2(x), r1=165(y), r2=106(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 165
LDI r2, 106
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
