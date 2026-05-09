; DESCRIPTION: Places a red 17x108 rectangle at position (369, 122).
; PLAN: r0=369(x), r1=122(y), r2=17(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 122
LDI r2, 17
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
