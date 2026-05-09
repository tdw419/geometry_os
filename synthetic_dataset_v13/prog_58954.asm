; DESCRIPTION: Renders a green box of size 30x23 starting at (166, 216).
; PLAN: r0=166(x), r1=216(y), r2=30(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 216
LDI r2, 30
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
