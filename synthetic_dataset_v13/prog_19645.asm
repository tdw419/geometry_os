; DESCRIPTION: Renders a yellow box of size 71x81 starting at (300, 80).
; PLAN: r0=300(x), r1=80(y), r2=71(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 80
LDI r2, 71
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
