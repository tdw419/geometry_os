; DESCRIPTION: Places a green 83x78 rectangle at position (423, 108).
; PLAN: r0=423(x), r1=108(y), r2=83(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 108
LDI r2, 83
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
