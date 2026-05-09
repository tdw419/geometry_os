; DESCRIPTION: Places a blue 39x83 rectangle at position (300, 101).
; PLAN: r0=300(x), r1=101(y), r2=39(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 101
LDI r2, 39
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
