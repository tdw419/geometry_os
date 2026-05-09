; DESCRIPTION: Places a yellow 100x115 rectangle at position (350, 94).
; PLAN: r0=350(x), r1=94(y), r2=100(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 94
LDI r2, 100
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
