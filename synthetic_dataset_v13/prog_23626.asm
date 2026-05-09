; DESCRIPTION: Renders a yellow box of size 38x91 starting at (412, 72).
; PLAN: r0=412(x), r1=72(y), r2=38(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 72
LDI r2, 38
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
