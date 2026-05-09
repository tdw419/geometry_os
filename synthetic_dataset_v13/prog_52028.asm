; DESCRIPTION: Places a green 21x31 rectangle at position (380, 35).
; PLAN: r0=380(x), r1=35(y), r2=21(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 35
LDI r2, 21
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
