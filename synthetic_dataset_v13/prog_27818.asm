; DESCRIPTION: Places a yellow 13x103 rectangle at position (313, 110).
; PLAN: r0=313(x), r1=110(y), r2=13(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 110
LDI r2, 13
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
