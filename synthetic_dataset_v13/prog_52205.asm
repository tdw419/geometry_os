; DESCRIPTION: Places a green 98x13 rectangle at position (79, 44).
; PLAN: r0=79(x), r1=44(y), r2=98(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 44
LDI r2, 98
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
