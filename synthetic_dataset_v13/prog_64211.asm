; DESCRIPTION: Places a cyan 35x57 rectangle at position (371, 30).
; PLAN: r0=371(x), r1=30(y), r2=35(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 30
LDI r2, 35
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
