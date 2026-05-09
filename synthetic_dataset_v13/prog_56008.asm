; DESCRIPTION: Renders a white box of size 95x29 starting at (6, 71).
; PLAN: r0=6(x), r1=71(y), r2=95(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 71
LDI r2, 95
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
