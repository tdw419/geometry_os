; DESCRIPTION: Renders a yellow box of size 53x54 starting at (327, 46).
; PLAN: r0=327(x), r1=46(y), r2=53(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 46
LDI r2, 53
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
