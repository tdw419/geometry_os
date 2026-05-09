; DESCRIPTION: Places a black 35x70 rectangle at position (271, 68).
; PLAN: r0=271(x), r1=68(y), r2=35(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 68
LDI r2, 35
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
