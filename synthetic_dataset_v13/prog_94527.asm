; DESCRIPTION: Places a blue 108x27 rectangle at position (62, 214).
; PLAN: r0=62(x), r1=214(y), r2=108(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 214
LDI r2, 108
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
