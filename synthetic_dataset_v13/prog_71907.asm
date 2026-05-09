; DESCRIPTION: Renders a white box of size 95x37 starting at (45, 12).
; PLAN: r0=45(x), r1=12(y), r2=95(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 12
LDI r2, 95
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
