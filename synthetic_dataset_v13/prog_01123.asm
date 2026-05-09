; DESCRIPTION: Places a black 70x108 rectangle at position (271, 30).
; PLAN: r0=271(x), r1=30(y), r2=70(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 30
LDI r2, 70
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
