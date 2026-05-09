; DESCRIPTION: Places a blue 104x79 rectangle at position (336, 157).
; PLAN: r0=336(x), r1=157(y), r2=104(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 157
LDI r2, 104
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
