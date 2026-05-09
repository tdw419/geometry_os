; DESCRIPTION: Places a cyan 57x84 rectangle at position (308, 132).
; PLAN: r0=308(x), r1=132(y), r2=57(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 132
LDI r2, 57
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
