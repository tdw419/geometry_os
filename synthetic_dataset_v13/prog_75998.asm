; DESCRIPTION: Places a blue 103x61 rectangle at position (198, 155).
; PLAN: r0=198(x), r1=155(y), r2=103(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 155
LDI r2, 103
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
