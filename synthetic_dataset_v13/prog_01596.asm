; DESCRIPTION: Places a green 13x55 rectangle at position (321, 104).
; PLAN: r0=321(x), r1=104(y), r2=13(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 104
LDI r2, 13
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
