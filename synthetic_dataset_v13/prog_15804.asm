; DESCRIPTION: Places a blue 13x99 rectangle at position (346, 144).
; PLAN: r0=346(x), r1=144(y), r2=13(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 144
LDI r2, 13
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
