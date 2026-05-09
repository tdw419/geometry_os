; DESCRIPTION: Places a blue 48x12 rectangle at position (328, 94).
; PLAN: r0=328(x), r1=94(y), r2=48(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 94
LDI r2, 48
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
