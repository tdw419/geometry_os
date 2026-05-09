; DESCRIPTION: Places a black 79x54 rectangle at position (319, 185).
; PLAN: r0=319(x), r1=185(y), r2=79(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 185
LDI r2, 79
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
