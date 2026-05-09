; DESCRIPTION: Places a blue 54x35 rectangle at position (77, 94).
; PLAN: r0=77(x), r1=94(y), r2=54(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 94
LDI r2, 54
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
