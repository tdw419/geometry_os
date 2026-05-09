; DESCRIPTION: Renders a yellow box of size 16x94 starting at (288, 18).
; PLAN: r0=288(x), r1=18(y), r2=16(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 18
LDI r2, 16
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
