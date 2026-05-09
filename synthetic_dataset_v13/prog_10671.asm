; DESCRIPTION: Places a yellow 75x63 rectangle at position (331, 175).
; PLAN: r0=331(x), r1=175(y), r2=75(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 175
LDI r2, 75
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
