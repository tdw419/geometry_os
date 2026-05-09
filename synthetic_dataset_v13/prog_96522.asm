; DESCRIPTION: Places a yellow 87x54 rectangle at position (179, 94).
; PLAN: r0=179(x), r1=94(y), r2=87(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 94
LDI r2, 87
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
