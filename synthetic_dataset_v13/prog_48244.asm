; DESCRIPTION: Places a blue 34x79 rectangle at position (191, 39).
; PLAN: r0=191(x), r1=39(y), r2=34(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 39
LDI r2, 34
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
