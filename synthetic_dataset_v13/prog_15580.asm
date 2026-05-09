; DESCRIPTION: Places a cyan 84x80 rectangle at position (37, 4).
; PLAN: r0=37(x), r1=4(y), r2=84(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 4
LDI r2, 84
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
