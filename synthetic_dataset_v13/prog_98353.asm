; DESCRIPTION: Places a purple 57x83 rectangle at position (243, 63).
; PLAN: r0=243(x), r1=63(y), r2=57(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 63
LDI r2, 57
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
