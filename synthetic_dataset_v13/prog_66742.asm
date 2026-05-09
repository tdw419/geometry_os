; DESCRIPTION: Renders a black box of size 99x61 starting at (72, 80).
; PLAN: r0=72(x), r1=80(y), r2=99(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 80
LDI r2, 99
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
