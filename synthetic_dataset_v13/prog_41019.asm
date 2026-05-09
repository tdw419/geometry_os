; DESCRIPTION: Places a cyan 97x66 rectangle at position (72, 70).
; PLAN: r0=72(x), r1=70(y), r2=97(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 70
LDI r2, 97
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
