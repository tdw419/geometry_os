; DESCRIPTION: Renders a black box of size 72x95 starting at (254, 84).
; PLAN: r0=254(x), r1=84(y), r2=72(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 84
LDI r2, 72
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
