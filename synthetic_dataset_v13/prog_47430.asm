; DESCRIPTION: Places a blue 84x109 rectangle at position (290, 98).
; PLAN: r0=290(x), r1=98(y), r2=84(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 98
LDI r2, 84
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
