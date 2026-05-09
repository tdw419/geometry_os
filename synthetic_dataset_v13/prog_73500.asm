; DESCRIPTION: Places a blue 56x73 rectangle at position (269, 104).
; PLAN: r0=269(x), r1=104(y), r2=56(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 104
LDI r2, 56
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
