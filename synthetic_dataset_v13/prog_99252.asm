; DESCRIPTION: Places a black 97x70 rectangle at position (403, 94).
; PLAN: r0=403(x), r1=94(y), r2=97(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 94
LDI r2, 97
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
