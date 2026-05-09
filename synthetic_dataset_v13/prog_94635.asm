; DESCRIPTION: Renders a yellow box of size 26x32 starting at (395, 223).
; PLAN: r0=395(x), r1=223(y), r2=26(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 223
LDI r2, 26
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
