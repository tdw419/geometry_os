; DESCRIPTION: Places a green 28x70 rectangle at position (8, 155).
; PLAN: r0=8(x), r1=155(y), r2=28(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 155
LDI r2, 28
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
