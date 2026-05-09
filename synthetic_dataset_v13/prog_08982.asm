; DESCRIPTION: Places a green 86x23 rectangle at position (321, 140).
; PLAN: r0=321(x), r1=140(y), r2=86(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 140
LDI r2, 86
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
