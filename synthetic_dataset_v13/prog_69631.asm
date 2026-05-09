; DESCRIPTION: Renders a green box of size 46x17 starting at (226, 32).
; PLAN: r0=226(x), r1=32(y), r2=46(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 32
LDI r2, 46
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
