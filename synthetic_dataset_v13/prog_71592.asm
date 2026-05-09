; DESCRIPTION: Places a blue 85x87 rectangle at position (271, 32).
; PLAN: r0=271(x), r1=32(y), r2=85(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 32
LDI r2, 85
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
