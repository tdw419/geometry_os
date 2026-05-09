; DESCRIPTION: Places a yellow 96x13 rectangle at position (371, 37).
; PLAN: r0=371(x), r1=37(y), r2=96(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 37
LDI r2, 96
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
