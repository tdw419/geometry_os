; DESCRIPTION: Renders a green box of size 68x29 starting at (93, 77).
; PLAN: r0=93(x), r1=77(y), r2=68(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 77
LDI r2, 68
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
