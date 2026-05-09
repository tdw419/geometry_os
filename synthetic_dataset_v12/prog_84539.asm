; DESCRIPTION: Places a yellow 68x31 rectangle at position (232, 171).
; PLAN: r0=232(x), r1=171(y), r2=68(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 171
LDI r2, 68
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
