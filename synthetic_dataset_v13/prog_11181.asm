; DESCRIPTION: Renders a green box of size 66x83 starting at (89, 46).
; PLAN: r0=89(x), r1=46(y), r2=66(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 46
LDI r2, 66
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
