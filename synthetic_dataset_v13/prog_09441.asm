; DESCRIPTION: Renders a green box of size 99x70 starting at (153, 91).
; PLAN: r0=153(x), r1=91(y), r2=99(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 91
LDI r2, 99
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
