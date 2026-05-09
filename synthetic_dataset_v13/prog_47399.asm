; DESCRIPTION: Places a green 98x70 rectangle at position (272, 31).
; PLAN: r0=272(x), r1=31(y), r2=98(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 31
LDI r2, 98
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
