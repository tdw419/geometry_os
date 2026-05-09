; DESCRIPTION: Renders a yellow box of size 34x55 starting at (395, 96).
; PLAN: r0=395(x), r1=96(y), r2=34(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 96
LDI r2, 34
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
