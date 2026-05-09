; DESCRIPTION: Renders a green box of size 17x112 starting at (328, 76).
; PLAN: r0=328(x), r1=76(y), r2=17(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 76
LDI r2, 17
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
