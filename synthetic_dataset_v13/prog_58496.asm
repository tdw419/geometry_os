; DESCRIPTION: Renders a yellow box of size 100x80 starting at (394, 38).
; PLAN: r0=394(x), r1=38(y), r2=100(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 38
LDI r2, 100
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
