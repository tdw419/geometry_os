; DESCRIPTION: Renders a green box of size 91x14 starting at (71, 20).
; PLAN: r0=71(x), r1=20(y), r2=91(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 20
LDI r2, 91
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
