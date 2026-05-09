; DESCRIPTION: Renders a yellow box of size 44x69 starting at (252, 38).
; PLAN: r0=252(x), r1=38(y), r2=44(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 38
LDI r2, 44
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
