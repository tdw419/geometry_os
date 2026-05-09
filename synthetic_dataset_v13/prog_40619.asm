; DESCRIPTION: Renders a black box of size 116x55 starting at (48, 65).
; PLAN: r0=48(x), r1=65(y), r2=116(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 65
LDI r2, 116
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
