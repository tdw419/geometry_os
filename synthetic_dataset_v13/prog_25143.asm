; DESCRIPTION: Places a purple 98x63 rectangle at position (165, 121).
; PLAN: r0=165(x), r1=121(y), r2=98(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 121
LDI r2, 98
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
