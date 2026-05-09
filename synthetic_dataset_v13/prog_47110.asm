; DESCRIPTION: Places a black 78x70 rectangle at position (433, 127).
; PLAN: r0=433(x), r1=127(y), r2=78(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 127
LDI r2, 78
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
