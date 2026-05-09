; DESCRIPTION: Places a cyan 81x79 rectangle at position (250, 165).
; PLAN: r0=250(x), r1=165(y), r2=81(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 165
LDI r2, 81
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
