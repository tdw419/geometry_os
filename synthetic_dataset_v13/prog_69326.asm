; DESCRIPTION: Places a blue 106x26 rectangle at position (395, 72).
; PLAN: r0=395(x), r1=72(y), r2=106(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 72
LDI r2, 106
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
