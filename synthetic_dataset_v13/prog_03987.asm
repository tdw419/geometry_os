; DESCRIPTION: Renders a green box of size 70x68 starting at (355, 115).
; PLAN: r0=355(x), r1=115(y), r2=70(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 115
LDI r2, 70
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
