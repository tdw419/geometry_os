; DESCRIPTION: Renders a black box of size 35x48 starting at (176, 84).
; PLAN: r0=176(x), r1=84(y), r2=35(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 84
LDI r2, 35
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
