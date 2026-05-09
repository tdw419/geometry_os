; DESCRIPTION: Places a purple 38x45 rectangle at position (319, 87).
; PLAN: r0=319(x), r1=87(y), r2=38(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 87
LDI r2, 38
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
