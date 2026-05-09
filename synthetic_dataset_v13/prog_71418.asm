; DESCRIPTION: Places a blue 60x13 rectangle at position (214, 229).
; PLAN: r0=214(x), r1=229(y), r2=60(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 229
LDI r2, 60
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
