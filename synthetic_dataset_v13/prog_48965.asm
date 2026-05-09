; DESCRIPTION: Places a blue 103x94 rectangle at position (20, 34).
; PLAN: r0=20(x), r1=34(y), r2=103(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 34
LDI r2, 103
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
