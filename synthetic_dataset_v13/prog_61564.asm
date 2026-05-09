; DESCRIPTION: Renders a yellow box of size 81x37 starting at (165, 21).
; PLAN: r0=165(x), r1=21(y), r2=81(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 21
LDI r2, 81
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
