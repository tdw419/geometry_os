; DESCRIPTION: Places a purple 68x11 rectangle at position (192, 44).
; PLAN: r0=192(x), r1=44(y), r2=68(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 44
LDI r2, 68
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
