; DESCRIPTION: Renders a yellow box of size 119x22 starting at (30, 210).
; PLAN: r0=30(x), r1=210(y), r2=119(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 210
LDI r2, 119
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
