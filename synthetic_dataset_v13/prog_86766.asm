; DESCRIPTION: Places a cyan 18x45 rectangle at position (218, 145).
; PLAN: r0=218(x), r1=145(y), r2=18(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 145
LDI r2, 18
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
