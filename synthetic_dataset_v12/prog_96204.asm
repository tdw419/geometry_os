; DESCRIPTION: Places a cyan 100x35 rectangle at position (127, 110).
; PLAN: r0=127(x), r1=110(y), r2=100(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 110
LDI r2, 100
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
