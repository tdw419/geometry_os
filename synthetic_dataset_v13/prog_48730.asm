; DESCRIPTION: Places a green 99x110 rectangle at position (411, 17).
; PLAN: r0=411(x), r1=17(y), r2=99(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 17
LDI r2, 99
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
