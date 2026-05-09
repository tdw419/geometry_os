; DESCRIPTION: Places a cyan 16x80 rectangle at position (271, 145).
; PLAN: r0=271(x), r1=145(y), r2=16(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 145
LDI r2, 16
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
