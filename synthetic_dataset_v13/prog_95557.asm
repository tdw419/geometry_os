; DESCRIPTION: Places a green 72x16 rectangle at position (436, 145).
; PLAN: r0=436(x), r1=145(y), r2=72(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 145
LDI r2, 72
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
