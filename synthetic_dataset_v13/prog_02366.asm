; DESCRIPTION: Places a blue 35x47 rectangle at position (223, 17).
; PLAN: r0=223(x), r1=17(y), r2=35(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 17
LDI r2, 35
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
