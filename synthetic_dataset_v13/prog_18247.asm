; DESCRIPTION: Places a green 32x75 rectangle at position (255, 145).
; PLAN: r0=255(x), r1=145(y), r2=32(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 145
LDI r2, 32
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
