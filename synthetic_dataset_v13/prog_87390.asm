; DESCRIPTION: Places a green 87x19 rectangle at position (319, 179).
; PLAN: r0=319(x), r1=179(y), r2=87(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 179
LDI r2, 87
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
