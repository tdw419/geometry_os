; DESCRIPTION: Renders a green box of size 46x81 starting at (210, 81).
; PLAN: r0=210(x), r1=81(y), r2=46(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 81
LDI r2, 46
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
