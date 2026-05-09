; DESCRIPTION: Renders a yellow box of size 10x14 starting at (368, 218).
; PLAN: r0=368(x), r1=218(y), r2=10(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 218
LDI r2, 10
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
