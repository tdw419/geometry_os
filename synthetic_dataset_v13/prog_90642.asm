; DESCRIPTION: Places a blue 22x79 rectangle at position (364, 166).
; PLAN: r0=364(x), r1=166(y), r2=22(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 166
LDI r2, 22
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
