; DESCRIPTION: Places a green 93x21 rectangle at position (185, 79).
; PLAN: r0=185(x), r1=79(y), r2=93(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 79
LDI r2, 93
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
