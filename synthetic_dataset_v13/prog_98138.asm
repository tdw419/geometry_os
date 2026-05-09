; DESCRIPTION: Renders a white box of size 76x71 starting at (311, 65).
; PLAN: r0=311(x), r1=65(y), r2=76(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 65
LDI r2, 76
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
