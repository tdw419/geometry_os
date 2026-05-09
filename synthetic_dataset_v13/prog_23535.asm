; DESCRIPTION: Renders a yellow box of size 40x33 starting at (345, 6).
; PLAN: r0=345(x), r1=6(y), r2=40(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 6
LDI r2, 40
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
