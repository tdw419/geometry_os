; DESCRIPTION: Places a green 33x87 rectangle at position (176, 89).
; PLAN: r0=176(x), r1=89(y), r2=33(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 89
LDI r2, 33
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
