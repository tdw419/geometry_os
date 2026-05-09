; DESCRIPTION: Places a blue 106x97 rectangle at position (332, 10).
; PLAN: r0=332(x), r1=10(y), r2=106(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 10
LDI r2, 106
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
