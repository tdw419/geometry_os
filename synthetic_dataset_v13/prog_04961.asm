; DESCRIPTION: Places a blue 113x96 rectangle at position (328, 160).
; PLAN: r0=328(x), r1=160(y), r2=113(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 160
LDI r2, 113
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
