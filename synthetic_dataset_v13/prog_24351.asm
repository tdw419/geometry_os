; DESCRIPTION: Renders a yellow box of size 37x71 starting at (55, 29).
; PLAN: r0=55(x), r1=29(y), r2=37(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 29
LDI r2, 37
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
