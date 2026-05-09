; DESCRIPTION: Renders a green box of size 109x33 starting at (219, 98).
; PLAN: r0=219(x), r1=98(y), r2=109(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 98
LDI r2, 109
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
