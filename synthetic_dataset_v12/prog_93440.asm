; DESCRIPTION: Renders a yellow box of size 37x19 starting at (232, 125).
; PLAN: r0=232(x), r1=125(y), r2=37(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 125
LDI r2, 37
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
