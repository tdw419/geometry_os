; DESCRIPTION: Places a black 70x78 rectangle at position (305, 84).
; PLAN: r0=305(x), r1=84(y), r2=70(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 84
LDI r2, 70
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
