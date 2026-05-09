; DESCRIPTION: Renders a green box of size 17x34 starting at (421, 91).
; PLAN: r0=421(x), r1=91(y), r2=17(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 91
LDI r2, 17
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
