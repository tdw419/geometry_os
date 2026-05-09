; DESCRIPTION: Places a blue 107x17 rectangle at position (39, 23).
; PLAN: r0=39(x), r1=23(y), r2=107(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 23
LDI r2, 107
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
