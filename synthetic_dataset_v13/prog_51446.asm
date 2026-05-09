; DESCRIPTION: Places a cyan 108x25 rectangle at position (272, 79).
; PLAN: r0=272(x), r1=79(y), r2=108(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 79
LDI r2, 108
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
