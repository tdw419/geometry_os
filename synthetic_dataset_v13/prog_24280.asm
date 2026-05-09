; DESCRIPTION: Places a yellow 96x19 rectangle at position (396, 127).
; PLAN: r0=396(x), r1=127(y), r2=96(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 127
LDI r2, 96
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
