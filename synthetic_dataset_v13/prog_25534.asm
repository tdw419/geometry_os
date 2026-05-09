; DESCRIPTION: Renders a yellow box of size 112x49 starting at (108, 16).
; PLAN: r0=108(x), r1=16(y), r2=112(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 16
LDI r2, 112
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
