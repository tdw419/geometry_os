; DESCRIPTION: Places a black 79x70 rectangle at position (178, 25).
; PLAN: r0=178(x), r1=25(y), r2=79(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 25
LDI r2, 79
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
