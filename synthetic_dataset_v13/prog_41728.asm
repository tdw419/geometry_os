; DESCRIPTION: Renders a yellow box of size 105x48 starting at (49, 142).
; PLAN: r0=49(x), r1=142(y), r2=105(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 142
LDI r2, 105
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
