; DESCRIPTION: Places a blue 65x47 rectangle at position (440, 94).
; PLAN: r0=440(x), r1=94(y), r2=65(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 94
LDI r2, 65
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
