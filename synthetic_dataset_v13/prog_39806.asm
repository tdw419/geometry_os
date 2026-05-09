; DESCRIPTION: Renders a green box of size 110x73 starting at (43, 142).
; PLAN: r0=43(x), r1=142(y), r2=110(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 142
LDI r2, 110
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
