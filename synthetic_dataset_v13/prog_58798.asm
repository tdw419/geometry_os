; DESCRIPTION: Places a blue 115x109 rectangle at position (338, 144).
; PLAN: r0=338(x), r1=144(y), r2=115(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 144
LDI r2, 115
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
