; DESCRIPTION: Places a blue 48x63 rectangle at position (261, 17).
; PLAN: r0=261(x), r1=17(y), r2=48(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 17
LDI r2, 48
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
