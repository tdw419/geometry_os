; DESCRIPTION: Places a green 71x37 rectangle at position (98, 79).
; PLAN: r0=98(x), r1=79(y), r2=71(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 79
LDI r2, 71
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
