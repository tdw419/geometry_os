; DESCRIPTION: Renders a white box of size 47x100 starting at (169, 9).
; PLAN: r0=169(x), r1=9(y), r2=47(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 9
LDI r2, 47
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
