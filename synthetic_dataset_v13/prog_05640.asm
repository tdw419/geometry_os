; DESCRIPTION: Renders a green box of size 78x49 starting at (81, 37).
; PLAN: r0=81(x), r1=37(y), r2=78(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 37
LDI r2, 78
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
