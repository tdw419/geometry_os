; DESCRIPTION: Places a blue 29x64 rectangle at position (377, 8).
; PLAN: r0=377(x), r1=8(y), r2=29(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 8
LDI r2, 29
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
