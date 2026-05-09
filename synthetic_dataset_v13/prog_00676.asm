; DESCRIPTION: Renders a green box of size 23x72 starting at (68, 34).
; PLAN: r0=68(x), r1=34(y), r2=23(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 34
LDI r2, 23
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
