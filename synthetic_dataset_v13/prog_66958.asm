; DESCRIPTION: Places a blue 39x43 rectangle at position (452, 7).
; PLAN: r0=452(x), r1=7(y), r2=39(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 7
LDI r2, 39
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
