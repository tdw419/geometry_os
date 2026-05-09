; DESCRIPTION: Renders a black box of size 64x21 starting at (48, 119).
; PLAN: r0=48(x), r1=119(y), r2=64(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 119
LDI r2, 64
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
