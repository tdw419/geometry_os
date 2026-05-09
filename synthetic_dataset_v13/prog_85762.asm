; DESCRIPTION: Renders a yellow box of size 39x71 starting at (193, 155).
; PLAN: r0=193(x), r1=155(y), r2=39(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 155
LDI r2, 39
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
