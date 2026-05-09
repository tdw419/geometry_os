; DESCRIPTION: Places a cyan 17x87 rectangle at position (216, 13).
; PLAN: r0=216(x), r1=13(y), r2=17(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 13
LDI r2, 17
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
