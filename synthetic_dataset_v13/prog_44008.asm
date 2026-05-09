; DESCRIPTION: Places a green 13x87 rectangle at position (486, 66).
; PLAN: r0=486(x), r1=66(y), r2=13(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 66
LDI r2, 13
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
