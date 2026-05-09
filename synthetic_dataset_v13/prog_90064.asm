; DESCRIPTION: Renders a green box of size 56x84 starting at (295, 130).
; PLAN: r0=295(x), r1=130(y), r2=56(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 130
LDI r2, 56
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
