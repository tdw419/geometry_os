; DESCRIPTION: Places a cyan 82x84 rectangle at position (371, 60).
; PLAN: r0=371(x), r1=60(y), r2=82(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 60
LDI r2, 82
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
