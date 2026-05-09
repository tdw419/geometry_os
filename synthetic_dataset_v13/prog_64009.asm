; DESCRIPTION: Places a cyan 108x85 rectangle at position (385, 61).
; PLAN: r0=385(x), r1=61(y), r2=108(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 61
LDI r2, 108
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
