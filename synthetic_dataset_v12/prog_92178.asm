; DESCRIPTION: Renders a green box of size 24x116 starting at (435, 138).
; PLAN: r0=435(x), r1=138(y), r2=24(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 138
LDI r2, 24
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
