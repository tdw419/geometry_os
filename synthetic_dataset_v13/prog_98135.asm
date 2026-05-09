; DESCRIPTION: Places a purple 96x112 rectangle at position (63, 65).
; PLAN: r0=63(x), r1=65(y), r2=96(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 65
LDI r2, 96
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
