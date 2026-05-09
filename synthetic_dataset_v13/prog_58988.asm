; DESCRIPTION: Places a blue 16x13 rectangle at position (393, 13).
; PLAN: r0=393(x), r1=13(y), r2=16(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 13
LDI r2, 16
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
