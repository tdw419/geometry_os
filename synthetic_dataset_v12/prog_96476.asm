; DESCRIPTION: Renders a green box of size 45x65 starting at (140, 102).
; PLAN: r0=140(x), r1=102(y), r2=45(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 102
LDI r2, 45
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
