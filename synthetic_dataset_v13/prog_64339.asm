; DESCRIPTION: Renders a green box of size 23x94 starting at (46, 57).
; PLAN: r0=46(x), r1=57(y), r2=23(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 57
LDI r2, 23
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
