; DESCRIPTION: Renders a yellow box of size 24x14 starting at (333, 52).
; PLAN: r0=333(x), r1=52(y), r2=24(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 52
LDI r2, 24
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
