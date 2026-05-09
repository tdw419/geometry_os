; DESCRIPTION: Places a yellow 58x103 rectangle at position (250, 127).
; PLAN: r0=250(x), r1=127(y), r2=58(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 127
LDI r2, 58
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
