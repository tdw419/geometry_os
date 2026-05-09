; DESCRIPTION: Places a cyan 84x70 rectangle at position (385, 99).
; PLAN: r0=385(x), r1=99(y), r2=84(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 99
LDI r2, 84
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
