; DESCRIPTION: Places a blue 65x99 rectangle at position (259, 23).
; PLAN: r0=259(x), r1=23(y), r2=65(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 23
LDI r2, 65
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
