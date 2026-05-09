; DESCRIPTION: Renders a green box of size 40x75 starting at (409, 141).
; PLAN: r0=409(x), r1=141(y), r2=40(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 141
LDI r2, 40
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
