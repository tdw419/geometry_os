; DESCRIPTION: Renders a white box of size 79x47 starting at (22, 127).
; PLAN: r0=22(x), r1=127(y), r2=79(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 127
LDI r2, 79
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
