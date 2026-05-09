; DESCRIPTION: Places a yellow 79x35 rectangle at position (363, 105).
; PLAN: r0=363(x), r1=105(y), r2=79(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 105
LDI r2, 79
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
