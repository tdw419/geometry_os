; DESCRIPTION: Places a cyan 108x45 rectangle at position (77, 24).
; PLAN: r0=77(x), r1=24(y), r2=108(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 24
LDI r2, 108
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
