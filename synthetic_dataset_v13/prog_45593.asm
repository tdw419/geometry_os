; DESCRIPTION: Renders a green box of size 93x104 starting at (355, 95).
; PLAN: r0=355(x), r1=95(y), r2=93(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 95
LDI r2, 93
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
