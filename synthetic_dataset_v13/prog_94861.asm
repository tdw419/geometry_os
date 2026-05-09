; DESCRIPTION: Renders a black box of size 32x33 starting at (65, 48).
; PLAN: r0=65(x), r1=48(y), r2=32(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 48
LDI r2, 32
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
