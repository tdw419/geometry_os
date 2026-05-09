; DESCRIPTION: Renders a white box of size 89x115 starting at (95, 62).
; PLAN: r0=95(x), r1=62(y), r2=89(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 62
LDI r2, 89
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
