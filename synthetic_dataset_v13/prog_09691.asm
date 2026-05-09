; DESCRIPTION: Places a black 79x23 rectangle at position (171, 98).
; PLAN: r0=171(x), r1=98(y), r2=79(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 98
LDI r2, 79
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
