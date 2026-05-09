; DESCRIPTION: Renders a green box of size 68x11 starting at (334, 140).
; PLAN: r0=334(x), r1=140(y), r2=68(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 140
LDI r2, 68
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
