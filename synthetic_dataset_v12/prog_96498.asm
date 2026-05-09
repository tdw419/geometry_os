; DESCRIPTION: Places a yellow 84x108 rectangle at position (261, 141).
; PLAN: r0=261(x), r1=141(y), r2=84(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 141
LDI r2, 84
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
