; DESCRIPTION: Places a blue 94x96 rectangle at position (186, 94).
; PLAN: r0=186(x), r1=94(y), r2=94(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 94
LDI r2, 94
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
