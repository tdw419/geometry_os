; DESCRIPTION: Renders a yellow box of size 71x18 starting at (406, 158).
; PLAN: r0=406(x), r1=158(y), r2=71(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 158
LDI r2, 71
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
