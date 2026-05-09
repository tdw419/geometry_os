; DESCRIPTION: Renders a green box of size 77x29 starting at (324, 60).
; PLAN: r0=324(x), r1=60(y), r2=77(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 60
LDI r2, 77
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
