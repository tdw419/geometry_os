; DESCRIPTION: Renders a yellow box of size 25x26 starting at (215, 58).
; PLAN: r0=215(x), r1=58(y), r2=25(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 58
LDI r2, 25
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
