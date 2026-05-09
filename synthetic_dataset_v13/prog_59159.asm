; DESCRIPTION: Places a cyan 18x50 rectangle at position (390, 37).
; PLAN: r0=390(x), r1=37(y), r2=18(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 37
LDI r2, 18
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
