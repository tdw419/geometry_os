; DESCRIPTION: Places a blue 15x94 rectangle at position (214, 13).
; PLAN: r0=214(x), r1=13(y), r2=15(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 13
LDI r2, 15
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
