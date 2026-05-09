; DESCRIPTION: Places a blue 11x19 rectangle at position (196, 214).
; PLAN: r0=196(x), r1=214(y), r2=11(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 214
LDI r2, 11
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
