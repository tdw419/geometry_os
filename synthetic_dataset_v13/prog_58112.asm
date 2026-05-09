; DESCRIPTION: Places a blue 94x62 rectangle at position (180, 162).
; PLAN: r0=180(x), r1=162(y), r2=94(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 162
LDI r2, 94
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
