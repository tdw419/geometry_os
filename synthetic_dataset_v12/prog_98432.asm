; DESCRIPTION: Renders a yellow box of size 106x116 starting at (269, 4).
; PLAN: r0=269(x), r1=4(y), r2=106(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 4
LDI r2, 106
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
