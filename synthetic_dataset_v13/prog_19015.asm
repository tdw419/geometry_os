; DESCRIPTION: Renders a green box of size 56x100 starting at (211, 33).
; PLAN: r0=211(x), r1=33(y), r2=56(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 33
LDI r2, 56
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
