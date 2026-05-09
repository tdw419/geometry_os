; DESCRIPTION: Places a cyan 84x39 rectangle at position (109, 119).
; PLAN: r0=109(x), r1=119(y), r2=84(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 119
LDI r2, 84
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
