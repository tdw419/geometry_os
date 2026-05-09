; DESCRIPTION: Places a cyan 60x39 rectangle at position (62, 2).
; PLAN: r0=62(x), r1=2(y), r2=60(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 2
LDI r2, 60
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
