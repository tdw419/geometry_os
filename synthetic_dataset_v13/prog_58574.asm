; DESCRIPTION: Places a cyan 13x118 rectangle at position (218, 1).
; PLAN: r0=218(x), r1=1(y), r2=13(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 1
LDI r2, 13
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
