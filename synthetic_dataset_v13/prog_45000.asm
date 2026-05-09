; DESCRIPTION: Renders a white box of size 102x115 starting at (45, 78).
; PLAN: r0=45(x), r1=78(y), r2=102(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 78
LDI r2, 102
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
