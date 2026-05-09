; DESCRIPTION: Places a cyan 53x80 rectangle at position (176, 160).
; PLAN: r0=176(x), r1=160(y), r2=53(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 160
LDI r2, 53
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
