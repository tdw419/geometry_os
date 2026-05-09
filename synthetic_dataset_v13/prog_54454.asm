; DESCRIPTION: Places a blue 78x23 rectangle at position (428, 197).
; PLAN: r0=428(x), r1=197(y), r2=78(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 197
LDI r2, 78
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
