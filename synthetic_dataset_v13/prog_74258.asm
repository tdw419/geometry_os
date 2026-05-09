; DESCRIPTION: Renders a white box of size 85x116 starting at (330, 89).
; PLAN: r0=330(x), r1=89(y), r2=85(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 89
LDI r2, 85
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
