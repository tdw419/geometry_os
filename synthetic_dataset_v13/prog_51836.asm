; DESCRIPTION: Renders a green box of size 115x19 starting at (244, 84).
; PLAN: r0=244(x), r1=84(y), r2=115(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 84
LDI r2, 115
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
