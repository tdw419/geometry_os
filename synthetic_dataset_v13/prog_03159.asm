; DESCRIPTION: Places a blue 48x50 rectangle at position (319, 160).
; PLAN: r0=319(x), r1=160(y), r2=48(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 160
LDI r2, 48
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
