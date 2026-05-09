; DESCRIPTION: Places a blue 120x64 rectangle at position (72, 110).
; PLAN: r0=72(x), r1=110(y), r2=120(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 110
LDI r2, 120
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
