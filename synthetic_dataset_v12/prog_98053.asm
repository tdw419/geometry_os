; DESCRIPTION: Renders a green box of size 70x63 starting at (130, 102).
; PLAN: r0=130(x), r1=102(y), r2=70(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 102
LDI r2, 70
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
