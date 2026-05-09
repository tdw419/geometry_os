; DESCRIPTION: Renders a green box of size 102x13 starting at (71, 140).
; PLAN: r0=71(x), r1=140(y), r2=102(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 140
LDI r2, 102
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
