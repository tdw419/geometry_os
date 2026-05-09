; DESCRIPTION: Places a purple 45x44 rectangle at position (455, 83).
; PLAN: r0=455(x), r1=83(y), r2=45(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 83
LDI r2, 45
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
