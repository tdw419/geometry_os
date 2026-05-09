; DESCRIPTION: Renders a green box of size 117x77 starting at (17, 148).
; PLAN: r0=17(x), r1=148(y), r2=117(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 148
LDI r2, 117
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
