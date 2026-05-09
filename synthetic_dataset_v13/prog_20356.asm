; DESCRIPTION: Renders a white box of size 40x92 starting at (253, 89).
; PLAN: r0=253(x), r1=89(y), r2=40(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 89
LDI r2, 40
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
