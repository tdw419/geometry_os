; DESCRIPTION: Places a blue 66x65 rectangle at position (255, 16).
; PLAN: r0=255(x), r1=16(y), r2=66(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 16
LDI r2, 66
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
