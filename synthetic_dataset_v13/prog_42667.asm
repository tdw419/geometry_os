; DESCRIPTION: Renders a yellow box of size 22x91 starting at (326, 39).
; PLAN: r0=326(x), r1=39(y), r2=22(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 39
LDI r2, 22
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
