; DESCRIPTION: Places a purple 99x29 rectangle at position (44, 166).
; PLAN: r0=44(x), r1=166(y), r2=99(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 166
LDI r2, 99
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
