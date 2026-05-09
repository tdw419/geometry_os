; DESCRIPTION: Places a blue 21x98 rectangle at position (326, 152).
; PLAN: r0=326(x), r1=152(y), r2=21(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 152
LDI r2, 21
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
