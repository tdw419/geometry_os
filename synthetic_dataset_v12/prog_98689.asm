; DESCRIPTION: Places a purple 18x40 rectangle at position (465, 31).
; PLAN: r0=465(x), r1=31(y), r2=18(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 31
LDI r2, 18
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
