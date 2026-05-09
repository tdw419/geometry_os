; DESCRIPTION: Places a blue 44x65 rectangle at position (278, 16).
; PLAN: r0=278(x), r1=16(y), r2=44(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 16
LDI r2, 44
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
