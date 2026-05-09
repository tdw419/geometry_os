; DESCRIPTION: Places a cyan 97x68 rectangle at position (293, 105).
; PLAN: r0=293(x), r1=105(y), r2=97(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 105
LDI r2, 97
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
