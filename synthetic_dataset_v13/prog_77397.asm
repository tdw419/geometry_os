; DESCRIPTION: Places a purple 13x99 rectangle at position (465, 32).
; PLAN: r0=465(x), r1=32(y), r2=13(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 32
LDI r2, 13
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
