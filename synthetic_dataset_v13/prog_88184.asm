; DESCRIPTION: Places a blue 117x14 rectangle at position (111, 152).
; PLAN: r0=111(x), r1=152(y), r2=117(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 152
LDI r2, 117
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
