; DESCRIPTION: Places a purple 57x18 rectangle at position (63, 137).
; PLAN: r0=63(x), r1=137(y), r2=57(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 137
LDI r2, 57
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
