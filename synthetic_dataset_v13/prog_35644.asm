; DESCRIPTION: Places a blue 61x39 rectangle at position (432, 155).
; PLAN: r0=432(x), r1=155(y), r2=61(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 155
LDI r2, 61
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
