; DESCRIPTION: Places a green 59x115 rectangle at position (432, 79).
; PLAN: r0=432(x), r1=79(y), r2=59(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 79
LDI r2, 59
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
