; DESCRIPTION: Renders a yellow box of size 29x116 starting at (90, 98).
; PLAN: r0=90(x), r1=98(y), r2=29(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 98
LDI r2, 29
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
