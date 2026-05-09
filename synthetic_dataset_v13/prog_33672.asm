; DESCRIPTION: Places a green 47x10 rectangle at position (418, 94).
; PLAN: r0=418(x), r1=94(y), r2=47(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 94
LDI r2, 47
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
