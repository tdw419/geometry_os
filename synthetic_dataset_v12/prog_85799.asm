; DESCRIPTION: Places a cyan 75x29 rectangle at position (227, 80).
; PLAN: r0=227(x), r1=80(y), r2=75(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 80
LDI r2, 75
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
