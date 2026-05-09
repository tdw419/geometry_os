; DESCRIPTION: Places a green 13x109 rectangle at position (163, 121).
; PLAN: r0=163(x), r1=121(y), r2=13(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 121
LDI r2, 13
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
